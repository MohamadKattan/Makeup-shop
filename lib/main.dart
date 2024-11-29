import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/views/main_pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}
