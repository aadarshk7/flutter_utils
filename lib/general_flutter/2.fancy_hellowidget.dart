import 'package:flutter/material.dart';

// code from flutter beginning of app development book
class FancyHelloWidget extends StatelessWidget {
  const FancyHelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A fancier app'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text('Hello world'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.thumb_up),
          onPressed: () => {
            print('Hello world'),
          },
        ),
      ),
    );
  }
}
