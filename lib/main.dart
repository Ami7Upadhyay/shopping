import 'package:flutter/material.dart';
import 'package:shopping/core/app_theme.dart';

import 'ui/explore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: AppTheme.lightTheme,
      home: const ExporePage(),
    );
  }
}
