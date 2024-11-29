import 'package:flutter/material.dart';

enum ScreenSize {
  isMobile,
  isIpad,
  isSmallLap,
  isDesktop;
}

class UiResponsev {
  static double mediaQuerySize(BuildContext context, {bool isHeight = false}) {
    Size mdiaQuery = MediaQuery.of(context).size;
    double width = mdiaQuery.width;
    double height = mdiaQuery.height;
    return isHeight ? height : width;
  }

  static ScreenSize screenType(BuildContext context) {
    double width = mediaQuerySize(context);
    if (width <= 480) {
      return ScreenSize.isMobile;
    } else if (width > 480 && width <= 768) {
      return ScreenSize.isIpad;
    } else if (width > 768 && width <1024) {
      return ScreenSize.isSmallLap;
    } else if (width >= 1024) {
      return ScreenSize.isDesktop;
    } else {
      return ScreenSize.isMobile;
    }
  }
}
