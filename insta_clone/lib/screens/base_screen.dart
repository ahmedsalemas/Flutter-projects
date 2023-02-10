import 'package:flutter/material.dart';

import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/viewModel(changenotifier)/base_screen_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/BaseScreen/base_bottomnavbar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Consumer<BaseScreenProvider>(
        builder: (context, provider, child) {
          return IndexedStack(
            index: provider.getCurrentIndex,
            children: provider.getScreens,
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: height * 0.055,
        child: const BottomNavBar(),
      ),
    );
  }
}
