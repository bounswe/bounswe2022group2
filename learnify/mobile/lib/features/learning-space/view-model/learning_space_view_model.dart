import 'dart:math';

import 'package:async/async.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/string/string_extensions.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../models/annotation_model.dart';
import '../models/chapter_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../models/learning_space_model.dart';
import '../models/event.dart';
import '../service/l_ls_service.dart';
import '../service/ls_service.dart';

/// View model to manage the data on learning space screen.
class LearningSpaceViewModel extends BaseViewModel {
  late final ILSService _lsService;
  // TODO: Will be taken from the course model when Egemen created it
  LearningSpace? learningSpace = LearningSpace();

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

  Future<String?> editEvent() async {
    // TODO: Fix
    // await navigationManager.navigateToPage(
    //     path: NavigationConstants.createEditChapter);
    return null;
  }

  Future<Annotation?> annotateText(int startIndex, int endIndex,
      String annotation, String? chapterId) async {
    final int itemIndex = _chapters.indexWhere(
        (Chapter c) => c.id?.compareWithoutCase(chapterId) ?? false);
    if (itemIndex == -1) return null;
    final Chapter oldChapter = _chapters[itemIndex];
    final Annotation newAnnotation = Annotation(
      id: (startIndex * endIndex + Random().nextInt(490)).toString(),
      content: annotation,
      startIndex: startIndex,
      endIndex: endIndex,
      chapterId: oldChapter.id,
      courseId: oldChapter.courseId,
    );
    final List<Annotation> newAnnotations =
        List<Annotation>.from(oldChapter.annotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _chapters[itemIndex] =
        _chapters[itemIndex].copyWith(annotations: newAnnotations);
    notifyListeners();
    return newAnnotation;
  }

  Future<Annotation?> annotateImage(
      Offset startOffset,
      Offset endOffset,
      String annotation,
      String? chapterId,
      Color color,
      String? imageUrl) async {
    final int itemIndex = _chapters.indexWhere(
        (Chapter c) => c.id?.compareWithoutCase(chapterId) ?? false);
    if (itemIndex == -1) return null;
    final Chapter oldChapter = _chapters[itemIndex];
    final Annotation newAnnotation = Annotation(
      id: (startOffset.dx * endOffset.dx + Random().nextInt(490)).toString(),
      content: annotation,
      startOffset: startOffset,
      endOffset: endOffset,
      chapterId: oldChapter.id,
      courseId: oldChapter.courseId,
      isImage: true,
      colorParam: color,
      imageUrl: imageUrl,
    );
    final List<Annotation> newAnnotations =
        List<Annotation>.from(oldChapter.annotations)
          ..add(newAnnotation)
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _chapters[itemIndex] =
        _chapters[itemIndex].copyWith(annotations: newAnnotations);
    notifyListeners();
    return newAnnotation;
  }

  Future<String?> enrollLearningSpace() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_enrollLearningSpaceRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _enrollLearningSpaceRequest() async {
    print("here");
    if (learningSpace?.title != null) {
      final EnrollLSRequest request = EnrollLSRequest(
        title: learningSpace?.title ?? "",
      );
      final IResponseModel<EnrollLSResponse> response =
          await _lsService.enrollLS(request);
      final EnrollLSResponse? respData = response.data;
      if (response.hasError || respData == null)
        return response.error?.errorMessage;
      final LearningSpace? ls = response.data?.learningSpace;
      print(ls?.title);
      if (ls == null) {
        print("No courses");
        return "Learning Space not found";
      }
    }

    return null;
  }
}
