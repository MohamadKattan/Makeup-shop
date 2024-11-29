import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';

class BtnsStyle {
  static ButtonStyle mainTxtBtn = ButtonStyle(
    padding: WidgetStateProperty.all(const EdgeInsets.all(12.0)),
    side: WidgetStateProperty.all(BorderSide(color: AppColors.white, width: 1)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  );
  static ButtonStyle secoundTxtBtn = ButtonStyle(
    padding: WidgetStateProperty.all(const EdgeInsets.all(12.0)),
    side: WidgetStateProperty.all(
        BorderSide(color: AppColors.darkGrey, width: 1)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    ),
  );
}
