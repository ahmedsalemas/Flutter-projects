import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'Reels Screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
