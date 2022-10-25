import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/auth/signup/view-model/signup_view_model.dart';
import '../../features/home/view-model/home_view_model.dart';
import '../managers/navigation/navigation_manager.dart';
import 'language/language_provider.dart';
import 'theme/theme_provider.dart';

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
      <SingleChildWidget>[
    ChangeNotifierProvider<SignupViewModel>(
      lazy: true,
      create: (_) => SignupViewModel(),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      lazy: true,
      create: (_) => HomeViewModel(),
    ),
  ];

  static final List<SingleChildWidget> _functionalProviders =
      <SingleChildWidget>[
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
    ),
    ChangeNotifierProvider<LanguageProvider>(
      create: (_) => LanguageProvider(),
    ),
    Provider<NavigationManager>.value(value: NavigationManager.instance)
  ];
}
