import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'home_posts_scrollview.dart';
import 'home_stories_scrollview.dart';

class HomeScrollView extends StatelessWidget {
  const HomeScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.black,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const HomeStoriesScrollView();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(
                height: height * 0.00001,
                color: AppColors.grey,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (BuildContext context, int index) {
                  return const HomePostsScrollView();
                },
              ),
            ),
          ],
        ));
  }
}
