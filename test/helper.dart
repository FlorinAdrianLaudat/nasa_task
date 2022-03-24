import 'package:flutter/material.dart';

class Helper {
  static Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  static Widget makeTestableCommonWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }
}
