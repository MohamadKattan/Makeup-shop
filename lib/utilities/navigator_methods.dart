import 'package:flutter/material.dart';

class NavMethods {
  static void push(BuildContext context, Widget child) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => child,
      ),
    );
  }

  static void replace(BuildContext context, Widget child) {
    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => child),
        (r) => false);
  }
}
