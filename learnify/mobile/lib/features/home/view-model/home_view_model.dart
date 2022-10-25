import '../../../../core/base/view-model/base_view_model.dart';

/// View model to manage the data on home screen.
class HomeViewModel extends BaseViewModel {
  @override
  void initViewModel() {}

  @override
  void initView() {
    _setDefault();
  }

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}
}
