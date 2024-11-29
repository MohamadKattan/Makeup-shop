import 'package:flutter/material.dart';

import '../../components/reuseable_btn.dart';

class ProfilePage extends StatelessWidget {
  final bool? fromBranch;
  const ProfilePage({this.fromBranch, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: fromBranch != null
            ? ReuseableBtn.navBtnBottomBar(context)
            : const SizedBox(),
        body: const Center(child: Text('ProfilePage')),
      ),
    );
  }
}
