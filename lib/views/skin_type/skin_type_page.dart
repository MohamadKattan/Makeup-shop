import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/app_style/app_text_style.dart';
import 'package:internet_shop_makeup/components/reuseable_bar.dart';
import 'package:internet_shop_makeup/components/reuseable_btn.dart';
import 'package:internet_shop_makeup/components/reuseable_txt.dart';
import 'package:internet_shop_makeup/utilities/navigator_methods.dart';
import 'package:internet_shop_makeup/views/skin_type/oily_skin.dart';

class SkinTypePage extends StatelessWidget {
  const SkinTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ReuseableBar.standerdAppBar(txt: 'По типу кожи'),
      bottomNavigationBar: ReuseableBtn.navBtnBottomBar(context),
      body: _listTile(context),
    );
  }

  Widget _listTile(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: ReuseableTxt.displayTxt('Жирная',
                textStyle: AppTextStyle.productSliderTxtstyle),
            onTap: () => NavMethods.push(context, const OilySkin()),
          ),
          ListTile(
            title: ReuseableTxt.displayTxt('Комбинированная',
                textStyle: AppTextStyle.productSliderTxtstyle),
            onTap: () => debugPrint('nav to an other page'),
          ),
          ListTile(
            title: ReuseableTxt.displayTxt('Нормальная',
                textStyle: AppTextStyle.productSliderTxtstyle),
            onTap: () => debugPrint('nav to an other page'),
          ),
          ListTile(
            title: ReuseableTxt.displayTxt('Сухая',
                textStyle: AppTextStyle.productSliderTxtstyle),
            onTap: () => debugPrint('nav to an other page'),
          ),
          ListTile(
            title: ReuseableTxt.displayTxt('Любой тип',
                textStyle: AppTextStyle.productSliderTxtstyle),
            onTap: () => debugPrint('nav to an other page'),
          ),
        ],
      ),
    );
  }
}
