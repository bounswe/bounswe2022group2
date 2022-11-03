import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/widgets/list/custom_expansion_tile.dart';
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
}
