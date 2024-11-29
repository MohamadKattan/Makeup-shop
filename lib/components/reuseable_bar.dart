import 'package:flutter/material.dart';

import '../app_style/app_colors.dart';
import 'reuseable_txt.dart';

class ReuseableBar {
  static PreferredSizeWidget standerdAppBar({String? txt, Color? bgColor}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(75.0),
      child: AppBar(
        backgroundColor: bgColor ?? AppColors.white,
        title: ReuseableTxt.displayTxt(txt ?? ''),
      ),
    );
  }
}
