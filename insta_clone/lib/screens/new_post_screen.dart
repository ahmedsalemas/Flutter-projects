import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'New Posts Screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
