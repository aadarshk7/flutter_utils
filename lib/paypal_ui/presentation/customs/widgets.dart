import 'package:flutter/material.dart';

class Widgets {
  static Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  static Widget buildEmpty(String message) {
    return Center(
      child: Text(message),
    );
  }
}
