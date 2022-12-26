import 'dart:async';
import 'dart:math';

import 'package:async/async.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:geolocator/geolocator.dart';

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
import '../models/comment/add_comment_request_model.dart';
import '../models/comment/add_comment_response_model.dart';
import '../models/comment/comment_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../models/event/event.dart';
import '../models/event/get_events_response.dart';
import '../models/geolocation/geolocation_model.dart';
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
  Map<String, List<Comment>> comments = <String, List<Comment>>{};

  late TextEditingController _eventTitleController;
  TextEditingController get eventTitleController => _eventTitleController;

  late TextEditingController _eventDescriptionController;
  TextEditingController get eventDescriptionController =>
      _eventDescriptionController;

  late TextEditingController _eventParticipationLimitController;
  TextEditingController get eventParticipationLimitController =>
      _eventParticipationLimitController;

  late TextEditingController _eventDurationController;
  TextEditingController get eventDurationController => _eventDurationController;

  late GlobalKey<FormState> _createEventFormKey;
  GlobalKey<FormState> get createEventFormKey => _createEventFormKey;

  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;

  bool _isDateSelected = false;
  bool get isDateSelected => _isDateSelected;

  late GeoLocation _geolocation = const GeoLocation();
  GeoLocation get geolocation => _geolocation;

  bool _canCreate = false;
  bool get canCreate => _canCreate;

  void setDefault() {
    _carouselPageIndexes = <int>[];
    _carouselControllers = <CarouselController>[];
    _posts = <Post>[];
    _learningSpace = null;
    annotations.clear();
    events.clear();
    _canCreate = false;
    _dateTime = null;
    _isDateSelected = false;
    comments.clear();
  }

  @override
  void initViewModel() {
    _lsService = LSService.instance;
    _posts = learningSpace?.posts ?? <Post>[];
    // _posts = List<Post>.generate(20, Post.dummy);
    // _events = List<Event>.generate(3, Event.dummy);
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _initializeKeys();
    _createEventFormKey = GlobalKey<FormState>();
    _eventTitleController = TextEditingController();
    _eventDescriptionController = TextEditingController();
    _eventParticipationLimitController = TextEditingController();
    _eventDurationController = TextEditingController();
    _eventTitleController.addListener(_controllerListener);
    _eventDescriptionController.addListener(_controllerListener);
    _eventParticipationLimitController.addListener(_controllerListener);
    _eventDurationController.addListener(_controllerListener);
  }

  void _controllerListener() {
    final String newTitle = _eventTitleController.text;
    final String newDescription = _eventDescriptionController.text;
    final String newParticipationLimit =
        _eventParticipationLimitController.text;
    final String newDuration = _eventDurationController.text;
    final bool newCanCreate = newTitle.isNotEmpty &&
        newDescription.isNotEmpty &&
        newParticipationLimit.isNotEmpty &&
        newDuration.isNotEmpty &&
        _isDateSelected;
    if (_canCreate == newCanCreate) return;
    _canCreate = newCanCreate;
    notifyListeners();
  }

  @override
  void disposeView() {
    _eventTitleController.dispose();
    _eventDescriptionController.dispose();
    _eventParticipationLimitController.dispose();
    _eventDurationController.dispose();
    _canCreate = false;
    _dateTime = null;
    _isDateSelected = false;
    super.disposeView();
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

    await navigationManager.navigateToPage(
      path: NavigationConstants.createEvent,
    );

    return null;
  }

  Future<String?> addCommentDialog(BuildContext context, String? postId) =>
      showDialog(
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
                      //final Tuple3<LearningSpace?, Comment?, String?> res =
                      addComment(postId);
                      Navigator.of(context).pop(_commentController.text);
                      _commentController.clear();
                    },
                    child: const BaseText(TextKeys.done),
                  )
                ],
              ));

  Future<Tuple3<LearningSpace?, Comment?, String?>> addComment(
      String? postId) async {
    final CommentRequestModel req = CommentRequestModel(
      lsId: _learningSpace?.id,
      postId: postId,
      content: _commentController.text,
    );
    final IResponseModel<AddCommentResponse> resp =
        await _lsService.addComment(req);
    if (resp.hasError) {
      return Tuple3<LearningSpace?, Comment?, String?>(
          null, null, resp.error?.errorMessage);
    } else {
      final Comment comment = Comment(
        id: resp.data?.comment?.id,
        content: resp.data?.comment?.content,
        creator: resp.data?.comment?.creator,
        images: resp.data?.comment?.images ?? <String>[],
      );

      final List<Comment> initialComments = comments[postId] ?? <Comment>[];
      final List<Comment> updatedComments = List<Comment>.from(initialComments)
        ..add(comment!);
      comments[postId ?? ''] = updatedComments;
      final int itemIndex = _posts
          .indexWhere((Post c) => c.id?.compareWithoutCase(postId) ?? false);
      posts[itemIndex].comments.add(comment);
      _learningSpace = _learningSpace?.copyWith(posts: _posts);
      notifyListeners();
      return Tuple3<LearningSpace?, Comment?, String?>(
          _learningSpace, comment, null);
    }
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

  void pickDateTime(DateTime selectedDate, TimeOfDay selectedTime) {
    final DateTime selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute);
    _dateTime = selectedDateTime;
    notifyListeners();
    _isDateSelected = true;
  }

  void resetIsDateSelected() {
    _isDateSelected = false;
    notifyListeners();
  }

  void setIsDateSelected() {
    _isDateSelected = true;
    notifyListeners();
  }

  Future<void> setInitialGeolocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    final Position tempPos = await Geolocator.getCurrentPosition();
    final GeoLocation tempGeolocation = GeoLocation(
        latitude: tempPos.latitude,
        longitude: tempPos.longitude,
        accuracy: tempPos.accuracy);

    _geolocation = tempGeolocation;
  }
}
