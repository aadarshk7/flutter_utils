import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// code from flutter beginning of app development book
class FancyHelloWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("A fancier app"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text("Hello world"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.thumb_up),
          onPressed: () => {
            print("Hello world"),
          },
        ),
      ),
    );
  }
}
