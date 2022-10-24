import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/managers/navigation/navigation_manager.dart';
import 'core/managers/navigation/navigation_route.dart';
import 'core/providers/language/language_provider.dart';
import 'core/providers/provider_list.dart';
import 'core/providers/theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InitialApp());
}

class InitialApp extends StatefulWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  State<InitialApp> createState() => InitialAppState();
}

class InitialAppState extends State<InitialApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: ProviderList.providers,
        child: const _MaterialApp(),
      );
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Learnify',
        debugShowCheckedModeBanner: false,
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
