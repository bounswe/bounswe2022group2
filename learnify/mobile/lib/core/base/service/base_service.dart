import '../../managers/network/l_network_manager.dart';
import '../../managers/network/network_manager.dart';

/// Base service provider.
abstract class BaseService {
  /// Initializes a network manager.
  final INetworkManager networkManager = NetworkManager.instance;
}
