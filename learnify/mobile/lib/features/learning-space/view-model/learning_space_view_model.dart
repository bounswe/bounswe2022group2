import 'dart:async';
import 'dart:math';

import 'package:async/async.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/string/string_extensions.dart';
import '../../../core/managers/local/local_manager.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/constants/storage_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../models/annotation/annotation_model.dart';
import '../models/annotation/create_annotation_request.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../models/event.dart';
import '../models/learning_space_model.dart';
import '../models/post_model.dart';
import '../service/ls_service.dart';

/// View model to manage the data on learning space screen.
class LearningSpaceViewModel extends BaseViewModel {
  late final LSService _lsService;
  LearningSpace? _learningSpace = const LearningSpace();
  LearningSpace? get learningSpace => _learningSpace;

  List<Post> _posts = <Post>[];
  List<Post> get posts => _posts;
  List<Event> _events = <Event>[];
  List<Event> get events => _events;
  List<GlobalKey<CustomExpansionTileState>> _expansionTileKeys =
      <GlobalKey<CustomExpansionTileState>>[];
  List<GlobalKey<CustomExpansionTileState>> get expansionTileKeys =>
      _expansionTileKeys;
  List<GlobalKey<CustomExpansionTileState>> _eventsExpansionTileKeys =
      <GlobalKey<CustomExpansionTileState>>[];
  List<GlobalKey<CustomExpansionTileState>> get eventsExpansionTileKeys =>
      _eventsExpansionTileKeys;

  List<CarouselController> _carouselControllers = <CarouselController>[];
  List<CarouselController> get carouselControllers => _carouselControllers;

  List<int> _carouselPageIndexes = <int>[];
  List<int> get carouselPageIndexes => _carouselPageIndexes;

  void setDefault() {
    _carouselPageIndexes = <int>[];
    _carouselControllers = <CarouselController>[];
    _events = <Event>[];
    _posts = <Post>[];
    _learningSpace = null;
  }

  @override
  void initViewModel() {
    _lsService = LSService.instance;
    _posts = learningSpace?.posts ?? <Post>[];
    // _posts = List<Post>.generate(20, Post.dummy);
    _events = List<Event>.generate(Random().nextInt(5), Event.dummy);
    _events
      ..sort((Event e1, Event e2) => e1.date.compareTo(e2.date))
      ..sort((Event e1, Event e2) => e1.date.isBefore(DateTime.now()) ? 1 : -1);
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _initializeKeys();
  }

  void setLearningSpace(LearningSpace? newSpace) {
    _learningSpace = newSpace;
    _posts = newSpace?.posts ?? <Post>[];
    // _posts = List<Post>.generate(20, Post.dummy);
    _events = List<Event>.generate(Random().nextInt(5), Event.dummy);
    _events
      ..sort((Event e1, Event e2) => e1.date.compareTo(e2.date))
      ..sort((Event e1, Event e2) => e1.date.isBefore(DateTime.now()) ? 1 : -1);
    _initializeKeys();
  }

  void _initializeKeys() {
    _expansionTileKeys = List<GlobalKey<CustomExpansionTileState>>.generate(
        _posts.length, (_) => GlobalKey<CustomExpansionTileState>());
    _eventsExpansionTileKeys =
        List<GlobalKey<CustomExpansionTileState>>.generate(
            _events.length, (_) => GlobalKey<CustomExpansionTileState>());
    _carouselControllers = List<CarouselController>.generate(
        _posts.length, (_) => CarouselController());
    _carouselPageIndexes = List<int>.generate(_posts.length, (_) => 0);
  }

  void setCarouselPageIndex(int newIndex, int i) {
    if (newIndex == _carouselPageIndexes[i]) return;
    _carouselPageIndexes[i] = newIndex;
    notifyListeners();
  }

  Future<String?> createPost() async {
    unawaited(NavigationManager.instance.navigateToPage(
        path: NavigationConstants.addEditPost,
        data: <String, dynamic>{'isAdd': true}));
    return null;
  }

  Future<String?> editPost(Post post) async {
    unawaited(NavigationManager.instance.navigateToPage(
        path: NavigationConstants.addEditPost,
        data: <String, dynamic>{'isAdd': false, 'post': post}));
    return null;
  }

  Future<String?> createEvent() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditPost);
    return null;
  }

  Future<String?> viewAnnotations(
      List<Annotation> annotations, String? annotationText) async {
    final User user =
        LocalManager.instance.getModel(const User(), StorageKeys.user);
    annotations.sort((Annotation a1, Annotation a2) {
      if (a1.creator == user.username) return -1;
      return 1;
    });
    unawaited(navigationManager.navigateToPage(
      path: NavigationConstants.annotations,
      data: <String, dynamic>{
        if (annotationText != null) 'annotatedText': annotationText,
        'annotations': annotations
      },
    ));
    return null;
  }

  Future<String?> attendEvent() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditPost);
    return null;
  }

  Future<String?> createDiscussion() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditPost);
    return null;
  }

  Future<Tuple3<LearningSpace?, Annotation?, String?>> annotateText(
      int startIndex, int endIndex, String annotation, String? postId) async {
    final int itemIndex = _posts
        .indexWhere((Post c) => c.id?.compareWithoutCase(postId) ?? false);
    if (itemIndex == -1) {
      return const Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, 'Post could not found.');
    }
    final Post oldPost = _posts[itemIndex];
    final AnnotationSelector selector =
        AnnotationSelector(start: startIndex, end: endIndex);
    final CreateAnnotationRequest req = CreateAnnotationRequest(
      body: annotation,
      lsId: _learningSpace?.id,
      postId: oldPost.id,
      target: AnnotationTarget(selector: selector),
    );
    final IResponseModel<AnyModel> res = await _lsService.annotate(req);
    if (res.hasError) {
      return Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, res.error?.errorMessage);
    } else {
      final Tuple2<LearningSpace?, Annotation?> newAnnotation =
          createTextAnnotation(
              startIndex, endIndex, annotation, oldPost, itemIndex);
      return Tuple3<LearningSpace?, Annotation?, String?>(
          newAnnotation.item1, newAnnotation.item2, null);
    }
  }

  Tuple2<LearningSpace?, Annotation?> createTextAnnotation(int startIndex,
      int endIndex, String annotation, Post post, int itemIndex) {
    final User user =
        LocalManager.instance.getModel(const User(), StorageKeys.user);
    final Annotation newAnnotation = Annotation(
      id: (startIndex * endIndex + Random().nextInt(490)).toString(),
      content: annotation,
      startIndex: startIndex,
      endIndex: endIndex,
      courseId: learningSpace?.id,
      postId: post.id,
      upVote: 0,
      creator: user.username,
    );
    final List<Annotation> newAnnotations =
        List<Annotation>.from(post.annotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _posts[itemIndex] = _posts[itemIndex].copyWith(annotations: newAnnotations);
    _learningSpace = _learningSpace?.copyWith(posts: _posts);
    notifyListeners();
    return Tuple2<LearningSpace?, Annotation?>(_learningSpace, newAnnotation);
  }

  Future<Tuple3<LearningSpace?, Annotation?, String?>> annotateImage(
      Offset startOffset,
      Offset endOffset,
      String annotation,
      String? postId,
      Color color,
      String? imageUrl) async {
    final int itemIndex = _posts
        .indexWhere((Post c) => c.id?.compareWithoutCase(postId) ?? false);
    if (itemIndex == -1) {
      return const Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, 'Post could not found.');
    }
    final Post oldPost = _posts[itemIndex];
    final double x = startOffset.dx;
    final double y = startOffset.dy;
    final double w = endOffset.dx - startOffset.dx;
    final double h = endOffset.dy - startOffset.dy;
    final AnnotationTarget target = AnnotationTarget(
        id: '$imageUrl#xywh=$x,$y,$w,$h', format: 'image/jpeg');
    final CreateAnnotationRequest req = CreateAnnotationRequest(
      body: annotation,
      lsId: _learningSpace?.id,
      postId: oldPost.id,
      target: target,
    );
    final IResponseModel<AnyModel> res = await _lsService.annotate(req);
    if (res.hasError) {
      return Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, res.error?.errorMessage);
    } else {
      final Tuple2<LearningSpace?, Annotation> newAnnotation =
          createImageAnnotation(
        startOffset,
        endOffset,
        color,
        imageUrl,
        annotation,
        oldPost,
        itemIndex,
      );
      return Tuple3<LearningSpace?, Annotation?, String?>(
          newAnnotation.item1, newAnnotation.item2, null);
    }
  }

  Future<String?> enrollLearningSpace() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_enrollLearningSpaceRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _enrollLearningSpaceRequest() async {
    final EnrollLSRequest request = EnrollLSRequest(
      title: learningSpace?.title ?? "",
    );
    final IResponseModel<EnrollLSResponse> response =
        await _lsService.enrollLS(request);
    if (response.hasError) {
      return response.error?.errorMessage;
    }
    final LearningSpace? ls = response.data?.learningSpace;
    if (ls == null) {
      return "Learning Space not found";
    }
    _learningSpace = ls;
    notifyListeners();
    return null;
  }

  Tuple2<LearningSpace?, Annotation> createImageAnnotation(
    Offset startOffset,
    Offset endOffset,
    Color backgroundColor,
    String? imageUrl,
    String annotation,
    Post post,
    int itemIndex,
  ) {
    final Offset foundStart = Offset(
        min(startOffset.dx, endOffset.dx), min(startOffset.dy, endOffset.dy));
    final Offset foundEnd = Offset(
        max(startOffset.dx, endOffset.dx), max(startOffset.dy, endOffset.dy));
    final User user =
        LocalManager.instance.getModel(const User(), StorageKeys.user);
    final Annotation newAnnotation = Annotation(
      id: (startOffset.dx * endOffset.dx + Random().nextInt(490)).toString(),
      content: annotation,
      startOffset: foundStart,
      endOffset: foundEnd,
      postId: post.id,
      courseId: learningSpace?.id,
      isImage: true,
      colorParam: backgroundColor,
      imageUrl: imageUrl,
      upVote: 0,
      creator: user.username,
    );
    final List<Annotation> newAnnotations =
        List<Annotation>.from(post.annotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _posts[itemIndex] = _posts[itemIndex].copyWith(annotations: newAnnotations);
    _learningSpace = _learningSpace?.copyWith(posts: _posts);
    notifyListeners();
    return Tuple2<LearningSpace?, Annotation>(_learningSpace, newAnnotation);
  }

  LearningSpace? addEditPost(Post post) {
    final int index = _posts.indexWhere((Post p) => p.id == post.id);
    final List<Post> newPosts = List<Post>.from(_posts);
    if (index == -1) {
      newPosts.add(post);
    } else {
      newPosts[index] = post;
    }
    _posts = newPosts;
    _learningSpace = _learningSpace?.copyWith(posts: newPosts);
    _initializeKeys();
    notifyListeners();
    return _learningSpace;
  }

  void setEvents(List<Event> newEvents) {
    if (newEvents != _events) {
      _events = newEvents;
    }
  }
}
