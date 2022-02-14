import 'package:flutter/material.dart';
import 'package:duu_chin/transit_page.dart';

import 'package:duu_chin/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '读琴',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: TransitPage(),
    );
  }
}