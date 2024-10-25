import 'package:flutter/material.dart';
import 'general_flutter/fancy_hellowidget.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod HTTP Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FancyHelloWidget(),
    );
  }
}
