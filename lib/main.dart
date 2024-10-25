import 'package:flutter/material.dart';
import 'general_flutter/3.animation_example.dart';
import 'general_flutter/4.simple_selector_animation.dart';
import 'general_flutter/2.fancy_hellowidget.dart';

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
      home: MyHomePage(),
    );
  }
}
