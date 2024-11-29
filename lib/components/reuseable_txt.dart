import 'package:flutter/material.dart';

class ReuseableTxt {
  static Widget displayTxt(String data, {TextStyle? textStyle}) {
    return Text(data, style: textStyle);
  }
}
