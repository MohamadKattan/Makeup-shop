import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/components/reuseable_txt.dart';
import 'package:internet_shop_makeup/utilities/navigator_methods.dart';
import 'package:internet_shop_makeup/views/main_pages/basket_page.dart';
import 'package:internet_shop_makeup/views/main_pages/main_page.dart';

import '../app_style/app_text_style.dart';
import '../views/main_pages/profile_page.dart';
import '../views/main_pages/search_page.dart';

class ReuseableBtn {
  static Widget txtBtn(String txt,
      {Function()? onPressed, TextStyle? txtStyle, ButtonStyle? btnStyle}) {
    return TextButton(
        onPressed: onPressed,
        style: btnStyle,
        child: ReuseableTxt.displayTxt(txt, textStyle: txtStyle));
  }

  static Widget navBtnBottomBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      onTap: (index) {
        switch (index) {
          case 0:
            NavMethods.replace(context, const MainPage());
            break;
          case 1:
            NavMethods.push(
                context,
                const SearchPage(
                  fromBranch: true,
                ));
            break;
          case 2:
            NavMethods.push(
                context,
                const BasketPage(
                  fromBranch: true,
                ));
            break;
          case 3:
            NavMethods.push(
                context,
                const ProfilePage(
                  fromBranch: true,
                ));
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: AppColors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: AppColors.black),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket_outlined, color: AppColors.black),
          label: 'Basket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: AppColors.black),
          label: 'Profile',
        ),
      ],
    );
  }

  static Widget elvBtn({
    Function()? onTap,
    Color? txtColor,
    Widget? child,
    String? label,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.transparent,
          disabledBackgroundColor: color ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Center(
            child: child ??
                ReuseableTxt.displayTxt(
                  label ?? '',
                  textStyle: AppTextStyle.productSliderTxtstyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: txtColor ?? AppColors.white),
                ),
          ),
        ),
      ),
    );
  }
}
