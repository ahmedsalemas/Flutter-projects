import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class ForYouSearchPostsScrollView extends StatelessWidget {
  const ForYouSearchPostsScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.003,
      height: height * 0.003,
      decoration: const BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage('lib/utils/images/instagram-logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
