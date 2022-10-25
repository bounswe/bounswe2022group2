import 'l_home_service.dart';

/// Service for network request of home view-model.
class HomeService extends IHomeService {
  /// Factory constructor for singleton structure.
  factory HomeService() => _instance;
  HomeService._();

  static final HomeService _instance = HomeService._();

  /// Static instance getter of [HomeService].
  static HomeService get instance => _instance;
}
