import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/app_style/app_colors.dart';
import 'package:internet_shop_makeup/views/main_pages/home_page.dart';
import 'package:internet_shop_makeup/views/main_pages/profile_page.dart';
import 'package:internet_shop_makeup/views/main_pages/search_page.dart';

import 'basket_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const SearchPage(),
    const BasketPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          onTap: onTabTapped, 
          currentIndex: _currentIndex, 
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
              icon:
                  Icon(Icons.shopping_basket_outlined, color: AppColors.black),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppColors.black),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
