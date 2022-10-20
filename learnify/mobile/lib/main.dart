import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/managers/navigation/navigation_manager.dart';
import 'core/managers/navigation/navigation_route.dart';
import 'core/providers/provider_list.dart';

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
        child: MaterialApp(
          title: 'Learnify',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationManager.instance.navigatorKey,
        ),
      );
}
