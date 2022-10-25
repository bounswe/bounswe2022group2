import 'package:flutter/material.dart';
import 'package:learnify/core/providers/provider_list.dart';
import 'package:provider/provider.dart';

Widget appWidget(Widget widget) => MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        builder: (_, __) => MultiProvider(
          providers: ProviderList.providers,
          child: Builder(builder: (_) => widget),
        ),
      ),
    );
