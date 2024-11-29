import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/app_style/app_text_style.dart';
import 'package:internet_shop_makeup/components/reusable_image_perview.dart';
import 'package:internet_shop_makeup/components/reuseable_btn.dart';
import 'package:internet_shop_makeup/components/reuseable_txt.dart';
import 'package:internet_shop_makeup/models/products_model.dart';
import 'package:internet_shop_makeup/utilities/navigator_methods.dart';
import 'package:internet_shop_makeup/utilities/ui_responsev.dart';
import 'package:internet_shop_makeup/views/main_pages/filter_page.dart';

import '../../components/reuseable_bar.dart';
import '../../utilities/local_repo.dart';

class OilySkin extends StatefulWidget {
  const OilySkin({super.key});

  @override
  State<OilySkin> createState() => _OilySkinState();
}

class _OilySkinState extends State<OilySkin> {
  int _selectedButtonIndex = -1;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: ReuseableBar.standerdAppBar(),
        bottomNavigationBar: ReuseableBtn.navBtnBottomBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ReuseableTxt.displayTxt('Средства\nдля жирной кожи',
                    textStyle: AppTextStyle.productSliderTxtstyle),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableTxt.displayTxt('28 продуктов'),
                    ReuseableBtn.elvBtn(
                        onTap: () =>
                            NavMethods.push(context, const FilterPage()),
                        child: ReusableImagePerview.imageFromAssets(
                            'assets/images/filtter.png'))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _buildButton(0, 'Очищение')),
                  Expanded(child: _buildButton(1, 'Увлажнение')),
                  Expanded(child: _buildButton(2, 'Регенерация')),
                ],
              ),
              const SizedBox(height: 60),
              _prodectSections()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(int index, String label) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(index),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _selectedButtonIndex == index ? AppColors.black : AppColors.grey,
          disabledBackgroundColor:
              _selectedButtonIndex == index ? AppColors.grey : AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Center(
            child: ReuseableTxt.displayTxt(
              label,
              textStyle: AppTextStyle.productSliderTxtstyle.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _selectedButtonIndex == index
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _prodectSections() {
    return Builder(builder: (context) {
      final hight = UiResponsev.mediaQuerySize(context, isHeight: true);
      final screen = UiResponsev.screenType(context);
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SizedBox(
          height: hight / 2,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _columnNum(screen),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: newProductsData.length,
            itemBuilder: (context, i) {
              final product = ProductsModel.fromJson(newProductsData[i]);
              return Card(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: ReusableImagePerview.imageFromAssets(
                          product.image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ReuseableTxt.displayTxt(
                        product.name!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReuseableTxt.displayTxt(
                        product.des!,
                        textStyle: AppTextStyle.productDecTxtstyle
                            .copyWith(fontSize: 12, color: AppColors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ReuseableTxt.displayTxt('${product.price}',
                          textStyle: AppTextStyle.productSliderTxtstyle),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }

  int _columnNum(ScreenSize screen) {
    int? num;
    switch (screen) {
      case ScreenSize.isMobile:
        num = 2;
        break;
      case ScreenSize.isIpad:
        num = 3;
        break;
      case ScreenSize.isSmallLap:
        num = 4;
        break;
      case ScreenSize.isDesktop:
        num = 4;
        break;
      default:
        num = 2;
    }

    return num;
  }
}
