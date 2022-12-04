import 'dart:math';

import 'package:async/async.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/string/string_extensions.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../../../product/constants/navigation_constants.dart';
import '../models/annotation/annotation_model.dart';
import '../models/annotation/create_annotation_request.dart';
import '../models/chapter_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../models/event.dart';
import '../models/learning_space_model.dart';
import '../service/ls_service.dart';

/// View model to manage the data on learning space screen.
class LearningSpaceViewModel extends BaseViewModel {
  late final LSService _lsService;
  // TODO: Will be taken from the course model when Egemen created it
  LearningSpace? learningSpace = const LearningSpace();

  List<Chapter> _chapters = <Chapter>[];
  List<Chapter> get chapters => _chapters;
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

  @override
  void initViewModel() {
    _lsService = LSService.instance;
    _chapters = List<Chapter>.generate(20, Chapter.dummy);
    _events = List<Event>.generate(20, Event.dummy);
    _events
      ..sort((Event e1, Event e2) => e1.date.compareTo(e2.date))
      ..sort((Event e1, Event e2) => e1.date.isBefore(DateTime.now()) ? 1 : -1);
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _expansionTileKeys = List<GlobalKey<CustomExpansionTileState>>.generate(
        _chapters.length, (_) => GlobalKey<CustomExpansionTileState>());
    _eventsExpansionTileKeys =
        List<GlobalKey<CustomExpansionTileState>>.generate(
            _events.length, (_) => GlobalKey<CustomExpansionTileState>());
    _carouselControllers = List<CarouselController>.generate(
        _chapters.length, (_) => CarouselController());
    _carouselPageIndexes = List<int>.generate(_chapters.length, (_) => 0);
  }

  @override
  void disposeView() {
    setDefault();
    super.disposeView();
  }

  void setDefault() {}

  void setCarouselPageIndex(int newIndex, int i) {
    if (newIndex == _carouselPageIndexes[i]) return;
    _carouselPageIndexes[i] = newIndex;
    notifyListeners();
  }

  Future<String?> createChapter() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditChapter);
    return null;
  }

  Future<String?> editChapter() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditChapter);
    return null;
  }

  Future<String?> createEvent() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditChapter);
    return null;
  }

  Future<String?> viewAnnotations(
      List<Annotation> annotations, String? annotationText) async {
    await navigationManager.navigateToPage(
      path: NavigationConstants.annotations,
      data: <String, dynamic>{
        if (annotationText != null) 'annotatedText': annotationText,
        'annotations': annotations
      },
    );
    return null;
  }

  Future<String?> editEvent() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditChapter);
    return null;
  }

  Future<String?> createDiscussion() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditChapter);
    return null;
  }

  Future<Tuple2<Annotation?, String?>> annotateText(int startIndex,
      int endIndex, String annotation, String? chapterId) async {
    final int itemIndex = _chapters.indexWhere(
        (Chapter c) => c.id?.compareWithoutCase(chapterId) ?? false);
    if (itemIndex == -1) {
      return const Tuple2<Annotation?, String?>(
          null, 'Chapter could not found.');
    }
    final Chapter oldChapter = _chapters[itemIndex];
    final AnnotationSelector selector =
        AnnotationSelector(start: startIndex, end: endIndex);
    // TODO: Fix
    final CreateAnnotationRequest req = CreateAnnotationRequest(
      body: annotation,
      // TODO:
      lsId: '638b2038a0a7908cbfdba928',
      postId: '638b20bea0a7908cbfdba92d',
      // lsId: oldChapter.courseId,
      // postId: oldChapter.id,
      target: AnnotationTarget(selector: selector),
    );
    final IResponseModel<AnyModel> res = await _lsService.annotate(req);
    if (res.hasError) {
      return Tuple2<Annotation?, String?>(null, res.error?.errorMessage);
    } else {
      final Annotation newAnnotation = createTextAnnotation(
          startIndex, endIndex, annotation, oldChapter, itemIndex);
      return Tuple2<Annotation?, String?>(newAnnotation, null);
    }
  }

  Annotation createTextAnnotation(int startIndex, int endIndex,
      String annotation, Chapter chapter, int itemIndex) {
    final Annotation newAnnotation = Annotation(
      id: (startIndex * endIndex + Random().nextInt(490)).toString(),
      content: annotation,
      startIndex: startIndex,
      endIndex: endIndex,
      courseId: chapter.courseId,
      chapterId: chapter.id,
    );
    final List<Annotation> newAnnotations =
        List<Annotation>.from(chapter.annotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _chapters[itemIndex] =
        _chapters[itemIndex].copyWith(annotations: newAnnotations);
    notifyListeners();
    return newAnnotation;
  }

  Future<Tuple2<Annotation?, String?>> annotateImage(
      Offset startOffset,
      Offset endOffset,
      String annotation,
      String? chapterId,
      Color color,
      String? imageUrl) async {
    final int itemIndex = _chapters.indexWhere(
        (Chapter c) => c.id?.compareWithoutCase(chapterId) ?? false);
    if (itemIndex == -1) {
      return const Tuple2<Annotation?, String?>(
          null, 'Chapter could not found.');
    }
    final Chapter oldChapter = _chapters[itemIndex];
    final double x = startOffset.dx;
    final double y = startOffset.dy;
    final double w = endOffset.dx - startOffset.dx;
    final double h = endOffset.dy - startOffset.dy;
    final AnnotationTarget target = AnnotationTarget(
        id: '$imageUrl#xywh=$x,$y,$w,$h', format: 'image/jpeg');
    final CreateAnnotationRequest req = CreateAnnotationRequest(
      body: annotation,
      // TODO: Fix
      lsId: '638b2038a0a7908cbfdba928',
      postId: '638b20bea0a7908cbfdba92d',
      // lsId: oldChapter.courseId,
      // postId: oldChapter.id,
      target: target,
    );
    final IResponseModel<AnyModel> res = await _lsService.annotate(req);
    if (res.hasError) {
      return Tuple2<Annotation?, String?>(null, res.error?.errorMessage);
    } else {
      final Annotation newAnnotation = createImageAnnotation(
        startOffset,
        endOffset,
        color,
        imageUrl,
        annotation,
        oldChapter,
        itemIndex,
      );
      return Tuple2<Annotation?, String?>(newAnnotation, null);
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
    return null;
  }

  Annotation createImageAnnotation(
    Offset startOffset,
    Offset endOffset,
    Color backgroundColor,
    String? imageUrl,
    String annotation,
    Chapter chapter,
    int itemIndex,
  ) {
    final Offset foundStart = Offset(
        min(startOffset.dx, endOffset.dx), min(startOffset.dy, endOffset.dy));
    final Offset foundEnd = Offset(
        max(startOffset.dx, endOffset.dx), max(startOffset.dy, endOffset.dy));
    final Annotation newAnnotation = Annotation(
      id: (startOffset.dx * endOffset.dx + Random().nextInt(490)).toString(),
      content: annotation,
      startOffset: foundStart,
      endOffset: foundEnd,
      chapterId: chapter.id,
      courseId: chapter.courseId,
      isImage: true,
      colorParam: backgroundColor,
      imageUrl: imageUrl,
    );
    final List<Annotation> newAnnotations =
        List<Annotation>.from(chapter.annotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _chapters[itemIndex] =
        _chapters[itemIndex].copyWith(annotations: newAnnotations);
    notifyListeners();
    return newAnnotation;
  }
}
