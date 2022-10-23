part of 'main_tester.dart';

Widget appWidget(Widget widget) => MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        builder: (_, __) => MultiProvider(
          providers: ProviderList.providers,
          child: Builder(builder: (_) => widget),
        ),
      ),
    );
