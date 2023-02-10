import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
