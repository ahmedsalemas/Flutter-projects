import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/SearchScreen/search_scrollview.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.1),
        child: AppBar(
          backgroundColor: AppColors.black,
        ),
      ),
      body: const SearchScrollView(),
    );
  }
}
