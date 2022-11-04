import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/string/string_extensions.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
import '../models/annotation_model.dart';
import '../models/chapter_model.dart';

/// View model to manage the data on learning space screen.
class LearningSpaceViewModel extends BaseViewModel {
  // TODO: Will be taken from the course model when Egemen created it
  List<Chapter> _chapters = <Chapter>[];
  List<Chapter> get chapters => _chapters;
  List<GlobalKey<CustomExpansionTileState>> _expansionTileKeys =
      <GlobalKey<CustomExpansionTileState>>[];
  List<GlobalKey<CustomExpansionTileState>> get expansionTileKeys =>
      _expansionTileKeys;

  List<CarouselController> _carouselControllers = <CarouselController>[];
  List<CarouselController> get carouselControllers => _carouselControllers;

  List<int> _carouselPageIndexes = <int>[];
  List<int> get carouselPageIndexes => _carouselPageIndexes;

  @override
  void initViewModel() {
    _chapters = List<Chapter>.generate(20, Chapter.dummy);
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _expansionTileKeys = List<GlobalKey<CustomExpansionTileState>>.generate(
        _chapters.length, (_) => GlobalKey<CustomExpansionTileState>());
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

  Future<String?> annotateText(int startIndex, int endIndex, String annotation,
      String? chapterId) async {
    final int itemIndex = _chapters.indexWhere(
        (Chapter c) => c.id?.compareWithoutCase(chapterId) ?? false);
    if (itemIndex == -1) return 'Chapter not found';
    final Chapter oldChapter = _chapters[itemIndex];
    final List<Annotation> newAnnotations =
        List<Annotation>.from(oldChapter.annotations)
          ..add(
            Annotation(
              content: annotation,
              startIndex: startIndex,
              endIndex: endIndex,
              chapterId: oldChapter.id,
              courseId: oldChapter.courseId,
            ),
          )
          ..sort((Annotation a1, Annotation a2) =>
              a1.startIndex.compareTo(a2.startIndex));
    _chapters[itemIndex] =
        _chapters[itemIndex].copyWith(annotations: newAnnotations);
    notifyListeners();
    return null;
  }
}