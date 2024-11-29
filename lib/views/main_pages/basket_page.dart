import 'package:flutter/material.dart';
import 'package:internet_shop_makeup/components/reuseable_btn.dart';

class BasketPage extends StatelessWidget {
  final bool? fromBranch;
  const BasketPage({this.fromBranch, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: fromBranch != null
            ? ReuseableBtn.navBtnBottomBar(context)
            : const SizedBox(),
        body: const Center(child: Text('BasketPage')),
      ),
    );
  }
}
