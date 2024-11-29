import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/app_style/app_text_style.dart';
import 'package:internet_shop_makeup/components/reuseable_btn.dart';
import 'package:internet_shop_makeup/components/reuseable_txt.dart';
import 'package:internet_shop_makeup/models/products_model.dart';
import 'package:internet_shop_makeup/models/products_slider_model.dart';
import 'package:internet_shop_makeup/utilities/local_repo.dart';
import 'package:internet_shop_makeup/utilities/ui_responsev.dart';

import '../../app_style/btns_style.dart';
import '../../components/reusable_image_perview.dart';
import '../../components/reuseable_indecator.dart';
import '../../models/carousel_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentImage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onScrollImageCarousel);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onScrollImageCarousel() {
    setState(() => _currentImage = _pageController.page!.round());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          children: [
            _carousel(),
            _productSlider(),
            _titleSection('assets/images/Frame 70.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _prodectSections(newProductsData),
            ),
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
            _titleSection('assets/images/Frame 71.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _prodectSections(descountProductsData),
            ),
            _btnToNav(),
            _titleSection('assets/images/Frame 71 copy.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _prodectSections(topProductsData),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }

  Widget _carousel() {
    return Builder(builder: (context) {
      final width = UiResponsev.mediaQuerySize(context);
      final hight = UiResponsev.mediaQuerySize(context, isHeight: true);
      final screenType = UiResponsev.screenType(context);
      return SizedBox(
        height: screenType == ScreenSize.isDesktop
            ? hight * 70 / 100
            : hight * 50 / 100,
        width: width,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: LocalRepo.carouselData.length,
          itemBuilder: (context, i) {
            final data = CarouselModel.fromJson(LocalRepo.carouselData[i]);
            return Stack(
              children: [
                ReusableImagePerview.imageFromAssets(data.imgUrl,
                    width: width, height: hight),
                Container(
                  height: hight,
                  width: width,
                  color: Colors.black.withOpacity(0.2),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ReuseableIndecators.circles(
                      LocalRepo.carouselData, _currentImage),
                ),
                Builder(builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: screenType == ScreenSize.isDesktop
                            ? hight * 15 / 100
                            : hight * 7 / 100,
                        left: width * 5 / 100),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ReuseableTxt.displayTxt(data.title,
                          textStyle: AppTextStyle.bigTilteWihte),
                    ),
                  );
                }),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: width * 7 / 100, left: width * 5 / 100),
                    child: ReuseableTxt.displayTxt(data.subTitle,
                        textStyle: AppTextStyle.bigSubTilteWihte),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ReuseableBtn.txtBtn('Перейти к акции',
                        btnStyle: BtnsStyle.mainTxtBtn,
                        txtStyle: AppTextStyle.btnTxt),
                  ),
                )
              ],
            );
          },
        ),
      );
    });
  }

  Widget _productSlider() {
    return Builder(
      builder: (context) {
        final screen = UiResponsev.screenType(context);
        final width = UiResponsev.mediaQuerySize(context);
        return Padding(
          padding: screen != ScreenSize.isMobile
              ? EdgeInsets.only(right: width * 25 / 100, left: width * 25 / 100)
              : const EdgeInsets.all(12),
          child: SizedBox(
            height: 150,
            width: width / 2,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: productSliderData.length,
              itemBuilder: (_, i) {
                final data = ProductsSliderModel.fromJson(productSliderData[i]);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: ReusableImagePerview.imageFromAssets(
                            data.url,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ReuseableTxt.displayTxt(data.name,
                          textStyle: AppTextStyle.productSliderTxtstyle)
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _titleSection(String path) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ReusableImagePerview.imageFromAssets(path)],
        ));
  }

  Widget _prodectSections(List list) {
    return Builder(
      builder: (context) {
        final screen = UiResponsev.screenType(context);
        final width = UiResponsev.mediaQuerySize(context);
        return Padding(
          padding: screen == ScreenSize.isDesktop
              ? EdgeInsets.only(right: width * 10 / 100, left: width * 10 / 100)
              : const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 350,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final product = ProductsModel.fromJson(list[i]);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Card(
                            color: AppColors.grey,
                            child: ReusableImagePerview.imageFromAssets(
                              product.image,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ReuseableTxt.displayTxt(product.name!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ReuseableTxt.displayTxt(
                            product.des!,
                            textStyle: AppTextStyle.productSliderTxtstyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReuseableTxt.displayTxt(
                                '${product.price}',
                                textStyle: AppTextStyle.productSliderTxtstyle,
                              ),
                              if (product.oldPrice != null)
                                Stack(
                                  children: [
                                    ReuseableTxt.displayTxt(
                                      '  ${product.oldPrice}',
                                      textStyle:
                                          AppTextStyle.productDecTxtstyle,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 2,
                                          width: 70,
                                          color: AppColors.darkGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _testSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ReuseableTxt.displayTxt('Моя схема домашнего ухода',
              textStyle: AppTextStyle.productSliderTxtstyle),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Card(
                color: AppColors.white,
                child: ReusableImagePerview.imageFromAssets(
                    'assets/images/Frame 55.png'),
              ),
            ),
            Expanded(
              child: Card(
                color: AppColors.white,
                child: ReusableImagePerview.imageFromAssets(
                    'assets/images/Frame 56.png'),
              ),
            ),
            Expanded(
              child: Card(
                color: AppColors.white,
                child: ReusableImagePerview.imageFromAssets(
                    'assets/images/Frame 57.png'),
              ),
            ),
            Expanded(
              child: Card(
                color: AppColors.white,
                child: ReusableImagePerview.imageFromAssets(
                    'assets/images/Frame 55.png'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ReuseableTxt.displayTxt(
                  'Ответьте на 10 вопросов,\nи мы подберем нужный уход',
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            GestureDetector(
                onTap: () => debugPrint('do some thing'),
                child: ReusableImagePerview.imageFromAssets(
                    'assets/images/Frame 52.jpg')),
          ],
        ),
      ],
    );
  }

  Widget _btnToNav() {
    return Builder(builder: (context) {
      final screen = UiResponsev.screenType(context);
      final width = UiResponsev.mediaQuerySize(context);
      return Padding(
        padding: screen == ScreenSize.isDesktop
            ? EdgeInsets.only(right: width * 10 / 100, left: width * 10 / 100)
            : const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReuseableBtn.txtBtn('Для очищения',
                      btnStyle: BtnsStyle.secoundTxtBtn),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReuseableBtn.txtBtn('Для увлажнения',
                      btnStyle: BtnsStyle.secoundTxtBtn),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReuseableBtn.txtBtn('Для питания',
                    btnStyle: BtnsStyle.secoundTxtBtn),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReuseableBtn.txtBtn(
                    'Для омоложения',
                    btnStyle: BtnsStyle.secoundTxtBtn,
                  ),
                ),
              )
            ]),
          ],
        ),
      );
    });
  }
}
