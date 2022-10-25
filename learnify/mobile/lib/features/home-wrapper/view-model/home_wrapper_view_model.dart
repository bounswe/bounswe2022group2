import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';

/// View model to manage the data on home wrapper screen.
class HomeWrapperViewModel extends BaseViewModel {
  int _bottomNavBarIndex = 0;

  /// Bottom nav bar index.
  int get bottomNavBarIndex => _bottomNavBarIndex;
  late GlobalKey<CurvedNavigationBarState> _bottomNavigationKey;
  GlobalKey<CurvedNavigationBarState> get bottomNavigationKey =>
      _bottomNavigationKey;

  @override
  void initViewModel() {}

  @override
  void initView() {
    _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
    _setDefault();
  }

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void setBottomNavIndex(int newIndex) {
    if (_bottomNavBarIndex == newIndex) return;
    _bottomNavBarIndex = newIndex;
    notifyListeners();
  }

  void _setDefault() {
    _bottomNavBarIndex = 0;
  }
}
