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
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/constants/storage_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../models/annotation/annotation_model.dart';
import '../models/annotation/create_annotation_response.dart';
import '../models/annotation/get_annotations_response.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../models/event/event.dart';
import '../models/event/get_events_response.dart';
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

  late TextEditingController _commentController;
  TextEditingController get commentController => _commentController;

  Map<String, List<Annotation>> annotations = <String, List<Annotation>>{};
  Map<String, List<Event>> events = <String, List<Event>>{};

  void setDefault() {
    _carouselPageIndexes = <int>[];
    _carouselControllers = <CarouselController>[];
    _posts = <Post>[];
    _learningSpace = null;
    annotations.clear();
    events.clear();
  }

  @override
  void initViewModel() {
    _lsService = LSService.instance;
    _posts = learningSpace?.posts ?? <Post>[];
    // _posts = List<Post>.generate(20, Post.dummy);
    // _events = List<Event>.generate(3, Event.dummy);
  }

  @override
  void disposeView() {
    commentController.dispose();
    super.disposeView();
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _initializeKeys();
    _commentController = TextEditingController();
  }

  void setLearningSpace(LearningSpace? newSpace) {
    _learningSpace = newSpace;
    _posts = newSpace?.posts ?? <Post>[];
    // _events = List<Event>.generate(3, Event.dummy);
    _initializeKeys();
  }

  void _initializeKeys() {
    _expansionTileKeys = List<GlobalKey<CustomExpansionTileState>>.generate(
        _posts.length, (_) => GlobalKey<CustomExpansionTileState>());
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

  Future<String?> addCommentDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const BaseText(TextKeys.addComment),
            content: CustomTextFormField(
              hintText: TextKeys.addCommentHint,
              maxLines: 3,
              controller: _commentController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(_commentController.text);
                  _commentController.clear();
                },
                child: const BaseText(TextKeys.done),
              )
            ],
          ));

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

  List<Annotation>? getFromMap(String postId) =>
      annotations.containsKey(postId) ? annotations[postId] : null;

  Future<List<Annotation>> getPostAnnotations(String postId) async {
    if (annotations.containsKey(postId)) {
      return annotations[postId]!;
    }
    final IResponseModel<GetAnnotationsResponse> response =
        await _lsService.getAnnotations(_learningSpace?.id ?? '', postId);
    if (response.hasError || response.data == null) return <Annotation>[];
    annotations[postId] = response.data!.annotations;
    notifyListeners();
    return annotations[postId] ?? <Annotation>[];
  }

  Future<Tuple3<LearningSpace?, Annotation?, String?>> annotateText(
      int startIndex, int endIndex, String annotation, String? postId) async {
    final int itemIndex = _posts
        .indexWhere((Post c) => c.id?.compareWithoutCase(postId) ?? false);
    if (itemIndex == -1) {
      return const Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, 'Post could not found.');
    }
    final User user =
        LocalManager.instance.getModel(const User(), StorageKeys.user);
    final Post oldPost = _posts[itemIndex];
    final AnnotationSelector selector = AnnotationSelector(
      start: startIndex,
      end: endIndex,
    );
    final Annotation req = Annotation(
      body: annotation,
      target: AnnotationTarget(
        selector: selector,
        source: 'http://18.159.61.178/${_learningSpace?.id}${oldPost.id}',
      ),
    );
    final IResponseModel<CreateAnnotationResponse> res = await _lsService
        .createAnnotation(req, _learningSpace?.id ?? '', oldPost.id ?? '');
    if (res.hasError) {
      return Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, res.error?.errorMessage);
    } else {
      final Tuple2<LearningSpace?, Annotation?> newAnnotation =
          await createTextAnnotation(
              startIndex,
              endIndex,
              annotation,
              res.data?.annotation?.id,
              res.data?.annotation?.creator,
              oldPost,
              itemIndex);
      return Tuple3<LearningSpace?, Annotation?, String?>(
          newAnnotation.item1, newAnnotation.item2, null);
    }
  }

  Future<Tuple2<LearningSpace?, Annotation?>> createTextAnnotation(
      int startIndex,
      int endIndex,
      String annotation,
      String? id,
      String? creator,
      Post post,
      int itemIndex) async {
    final Annotation newAnnotation = Annotation(
      body: annotation,
      id: id,
      creator: creator,
      target: AnnotationTarget(
        selector: AnnotationSelector(
          start: startIndex,
          end: endIndex,
        ),
        source: 'http://18.159.61.178/${learningSpace?.id}${post.id}',
      ),
    );
    final List<Annotation> oldAnnotations =
        await getPostAnnotations(post.id ?? '');
    final List<Annotation> newAnnotations =
        List<Annotation>.from(oldAnnotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    annotations[_posts[itemIndex].id ?? ''] = newAnnotations;
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
        id: '$imageUrl#xywh=$x,$y,$w,$h',
        format: 'image/jpeg',
        type: 'Image',
        source: 'http://18.159.61.178/${learningSpace?.id}${oldPost.id}');
    final Annotation req = Annotation(body: annotation, target: target);
    final IResponseModel<CreateAnnotationResponse> res = await _lsService
        .createAnnotation(req, _learningSpace?.id ?? '', oldPost.id ?? '');
    if (res.hasError) {
      return Tuple3<LearningSpace?, Annotation?, String?>(
          null, null, res.error?.errorMessage);
    } else {
      final Tuple2<LearningSpace?, Annotation> newAnnotation =
          await createImageAnnotation(
        startOffset,
        endOffset,
        color,
        imageUrl,
        annotation,
        res.data?.annotation?.id,
        res.data?.annotation?.creator,
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

  Future<Tuple2<LearningSpace?, Annotation>> createImageAnnotation(
    Offset startOffset,
    Offset endOffset,
    Color backgroundColor,
    String? imageUrl,
    String annotation,
    String? id,
    String? creator,
    Post post,
    int itemIndex,
  ) async {
    final Offset foundStart = Offset(
        min(startOffset.dx, endOffset.dx), min(startOffset.dy, endOffset.dy));
    final Offset foundEnd = Offset(
        max(startOffset.dx, endOffset.dx), max(startOffset.dy, endOffset.dy));
    final Annotation newAnnotation = Annotation(
      body: annotation,
      id: id,
      creator: creator,
      target: AnnotationTarget(
          source: 'http://18.159.61.178/${learningSpace?.id}${post.id}',
          type: 'Image',
          id: '$imageUrl#xywh=${foundStart.dx},${foundStart.dy},${foundEnd.dx - foundStart.dx},${foundEnd.dy - foundStart.dy}'),
      colorParam: backgroundColor,
    );
    final List<Annotation> oldAnnotations =
        await getPostAnnotations(post.id ?? '');
    final List<Annotation> newAnnotations =
        List<Annotation>.from(oldAnnotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    annotations[_posts[itemIndex].id ?? ''] = newAnnotations;
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

  List<Event>? get eventsOfLs {
    final List<Event>? eventsList = events.containsKey(_learningSpace?.id)
        ? events[_learningSpace?.id]
        : null;
    if (eventsList == null) return null;
    _eventsExpansionTileKeys =
        List<GlobalKey<CustomExpansionTileState>>.generate(
            eventsList.length, (_) => GlobalKey<CustomExpansionTileState>());
    return eventsList;
  }

  Future<List<Event>> getEvents() async {
    final String lsId = _learningSpace?.id ?? '';
    if (events.containsKey(lsId)) {
      return events[lsId]!;
    }
    final IResponseModel<GetEventsResponse> response =
        await _lsService.getEvents(lsId);
    if (response.hasError || response.data == null) return <Event>[];
    events[lsId] = response.data!.events;
    _eventsExpansionTileKeys =
        List<GlobalKey<CustomExpansionTileState>>.generate(
            response.data!.events.length,
            (_) => GlobalKey<CustomExpansionTileState>());
    notifyListeners();
    return events[lsId] ?? <Event>[];
  }

  void setEvents(List<Event> newEvents, String lsId) {
    events[lsId] = newEvents;
    _eventsExpansionTileKeys =
        List<GlobalKey<CustomExpansionTileState>>.generate(
            newEvents.length, (_) => GlobalKey<CustomExpansionTileState>());
  }
}
