import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/components/reuseable_bar.dart';
import 'package:internet_shop_makeup/components/reuseable_btn.dart';

import '../../app_style/app_text_style.dart';
import '../../components/reuseable_txt.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: ReuseableBar.standerdAppBar(txt: 'Фильтры'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [const SizedBox(height: 40), _listTile(context)],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReuseableBtn.elvBtn(
                        color: AppColors.black, label: 'Применить фильтры'),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _listTile(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: ReuseableTxt.displayTxt('Сортировка',
              textStyle: AppTextStyle.productSliderTxtstyle),
          trailing: ReuseableTxt.displayTxt('По популярности',
              textStyle: AppTextStyle.productDecTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: ReuseableTxt.displayTxt('Тип кожи',
              textStyle: AppTextStyle.productSliderTxtstyle),
          trailing: ReuseableTxt.displayTxt('Жирная',
              textStyle: AppTextStyle.productDecTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
            title: ReuseableTxt.displayTxt('Тип средства',
                textStyle: AppTextStyle.productSliderTxtstyle),
            trailing: ReuseableTxt.displayTxt('Все',
                textStyle: AppTextStyle.productDecTxtstyle),
            onTap: () {
              debugPrint('nav to an other page');
            }),
        ListTile(
          title: ReuseableTxt.displayTxt('Проблема кожи',
              textStyle: AppTextStyle.productSliderTxtstyle),
          trailing: ReuseableTxt.displayTxt('Не выбрано',
              textStyle: AppTextStyle.productDecTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: ReuseableTxt.displayTxt('Эффект средства',
              textStyle: AppTextStyle.productSliderTxtstyle),
          trailing: ReuseableTxt.displayTxt('Увлаженение',
              textStyle: AppTextStyle.productDecTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: ReuseableTxt.displayTxt('Линия косметики',
              textStyle: AppTextStyle.productSliderTxtstyle),
          trailing: ReuseableTxt.displayTxt('Все',
              textStyle: AppTextStyle.productDecTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
      ],
    );
  }
}
