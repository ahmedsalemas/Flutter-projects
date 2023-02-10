import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/SearchScreen/foryou_search_posts_scrollview.dart';

import '../../utils/colors.dart';

import '../searchbar.dart';

class SearchScrollView extends StatelessWidget {
  const SearchScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: MessagesSearchBar(),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: height * 0.002,
              crossAxisSpacing: width * 0.002,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const ForYouSearchPostsScrollView();
              },
              childCount: 50,
            ),
          )
        ],
      ),
    );
  }
}
