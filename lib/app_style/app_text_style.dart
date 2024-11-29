import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';

class AppTextStyle {
  static TextStyle bigTilteWihte = TextStyle(
      color: AppColors.white,
      fontSize: 35.05,
      fontWeight: FontWeight.w600,
      height: 2,
      letterSpacing: 1);

  static TextStyle bigSubTilteWihte = TextStyle(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 1);

  static TextStyle btnTxt = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle productSliderTxtstyle = TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1,
      wordSpacing: 1.5);

  static TextStyle productDecTxtstyle = const TextStyle(
      color: Color.fromARGB(255, 204, 201, 201),
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1,
      wordSpacing: 1.5);
}
