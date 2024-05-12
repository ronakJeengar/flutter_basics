import 'package:flutter/material.dart';
import 'package:flutterproject/layout_builder.dart';
import 'package:flutterproject/more_widgets.dart';
import 'package:flutterproject/shop.dart';

import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MoreWidgets(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

