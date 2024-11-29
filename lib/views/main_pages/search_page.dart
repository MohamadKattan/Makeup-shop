import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/app_style/app_text_style.dart';
import 'package:internet_shop_makeup/components/reusable_image_perview.dart';
import 'package:internet_shop_makeup/components/reuseable_btn.dart';
import 'package:internet_shop_makeup/components/reuseable_txt.dart';
import 'package:internet_shop_makeup/utilities/navigator_methods.dart';
import 'package:internet_shop_makeup/utilities/ui_responsev.dart';
import 'package:internet_shop_makeup/views/skin_type/skin_type_page.dart';

class SearchPage extends StatelessWidget {
  final bool? fromBranch;
  const SearchPage({this.fromBranch, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: fromBranch != null
            ? ReuseableBtn.navBtnBottomBar(context)
            : const SizedBox(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _textFieled(),
              const SizedBox(height: 20),
              _listTile(context),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  final screen = UiResponsev.screenType(context);
                  final width = UiResponsev.mediaQuerySize(context);
                  return Padding(
                    padding: screen == ScreenSize.isDesktop
                        ? EdgeInsets.only(
                            right: width * 10 / 100, left: width * 10 / 100)
                        : const EdgeInsets.all(12),
                    child: ReusableImagePerview.containerImageBg(
                        'assets/images/image 48.png', _testSection()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieled() {
    return Builder(builder: (context) {
      final width = UiResponsev.mediaQuerySize(context);
      final screenType = UiResponsev.screenType(context);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: screenType == ScreenSize.isDesktop ? width / 2 : width,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Поиск',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _listTile(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: ReuseableTxt.displayTxt('Назначение',
              textStyle: AppTextStyle.productSliderTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: ReuseableTxt.displayTxt('Тип средства',
              textStyle: AppTextStyle.productSliderTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
            title: ReuseableTxt.displayTxt('Тип кожи',
                textStyle: AppTextStyle.productSliderTxtstyle),
            onTap: () {
              NavMethods.push(context, const SkinTypePage());
            }),
        ListTile(
          title: ReuseableTxt.displayTxt('Линия косметики',
              textStyle: AppTextStyle.productSliderTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: ReuseableTxt.displayTxt('Наборы',
              textStyle: AppTextStyle.productSliderTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReuseableTxt.displayTxt('Акции',
                  textStyle: AppTextStyle.productSliderTxtstyle),
              ReusableImagePerview.imageFromAssets(
                  'assets/images/Frame 48 copy.png')
            ],
          ),
          onTap: () => debugPrint('nav to an other page'),
        ),
        ListTile(
          title: ReuseableTxt.displayTxt('Консультация\nс косметологом',
              textStyle: AppTextStyle.productSliderTxtstyle),
          onTap: () => debugPrint('nav to an other page'),
        ),
      ],
    );
  }

  Widget _testSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReuseableTxt.displayTxt(
                  'Составим схему идеального\nдомашнего ухода',
                  textStyle: AppTextStyle.productSliderTxtstyle),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReuseableTxt.displayTxt(
                'Составим схему идеального\nдомашнего ухода',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () => debugPrint('do some thing'),
                  child: ReusableImagePerview.imageFromAssets(
                      'assets/images/Frame 52.jpg')),
            ),
          ],
        ),
      ],
    );
  }
}
