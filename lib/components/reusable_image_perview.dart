// reusable image perviews
import 'package:flutter/material.dart';

class ReusableImagePerview {
  static Image imageFromAssets(String path,
      {double? width, double? height, BoxFit? fit}) {
    return Image.asset(path,
        height: height, width: width, fit: fit ?? BoxFit.fill);
  }

  static Widget containerImageBg(String path, Widget child) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
