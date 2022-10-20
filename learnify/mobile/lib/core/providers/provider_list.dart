import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../managers/navigation/navigation_manager.dart';

/// Provides the list of providers will be used across the app.
class ProviderList {
  /// Singleton instance of [ProviderList].
  factory ProviderList() => _instance;
  ProviderList._();
  static final ProviderList _instance = ProviderList._();

  /// List of providers will be used for main [MultiProvider] class.
  static final List<SingleChildWidget> providers = <SingleChildWidget>[
    ..._functionalProviders,
    ..._viewModelProviders,
  ];

  static final List<SingleChildWidget> _viewModelProviders =
      <SingleChildWidget>[];

  static final List<SingleChildWidget> _functionalProviders =
      <SingleChildWidget>[
    Provider<NavigationManager>.value(value: NavigationManager.instance)
  ];
}
