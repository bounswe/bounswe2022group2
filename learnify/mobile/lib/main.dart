import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: const MaterialApp(
          title: 'Learnify',
          debugShowCheckedModeBanner: false,
        ),
      );
}
