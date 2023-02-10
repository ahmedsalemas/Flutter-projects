import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'Shop Screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
