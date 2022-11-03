import '../../../../core/base/view-model/base_view_model.dart';
import '../models/chapter_model.dart';

/// View model to manage the data on learning space screen.
class LearningSpaceViewModel extends BaseViewModel {
  // TODO: Will be taken from the course model when Egemen created it
  List<Chapter> _chapters = <Chapter>[];
  List<Chapter> get chapters => _chapters;

  @override
  void initViewModel() {
    _chapters = List<Chapter>.generate(12, Chapter.dummy);
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {}

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}
}
