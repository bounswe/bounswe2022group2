import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'core/managers/local/local_manager.dart';
import 'core/managers/navigation/navigation_manager.dart';
import 'core/managers/navigation/navigation_route.dart';
import 'core/managers/network/custom_interceptors.dart';
import 'core/providers/language/language_provider.dart';
import 'core/providers/provider_list.dart';
import 'core/providers/theme/theme_provider.dart';
import 'features/auth/verification/model/user_model.dart';
import 'product/constants/navigation_constants.dart';
import 'product/constants/storage_keys.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await LocalManager().initPreferences();
  final bool hasToken = CustomInterceptors.getStoredToken != null;
  final User user =
      LocalManager.instance.getModel(const User(), StorageKeys.user);
  final bool hasAuth = hasToken && user.email != null;
  FlutterNativeSplash.remove();
  runApp(InitialApp(hasAuth: hasAuth));
}

class InitialApp extends StatefulWidget {
  const InitialApp({required this.hasAuth, Key? key}) : super(key: key);
  final bool hasAuth;

  @override
  State<InitialApp> createState() => InitialAppState();
}

class InitialAppState extends State<InitialApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: ProviderList.providers,
        child: _MaterialApp(hasAuth: widget.hasAuth),
      );
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({required this.hasAuth, Key? key}) : super(key: key);
  final bool hasAuth;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Learnify',
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[MyNavigatorObserver()],
        initialRoute:
            hasAuth ? NavigationConstants.home : NavigationConstants.signup,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationManager.instance.navigatorKey,
        theme: context.watch<ThemeProvider>().currentTheme,
        localizationsDelegates: LanguageProvider.delegates,
        supportedLocales: LanguageProvider.supportedLocales,
        locale: context.watch<LanguageProvider>().appLocal,
        localeListResolutionCallback: (List<Locale>? locales, _) =>
            context.read<LanguageProvider>().localeCallback(locales),
      );
}
