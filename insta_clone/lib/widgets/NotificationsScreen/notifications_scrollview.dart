import 'package:flutter/material.dart';

import '../../utils/colors.dart';

import 'notifications_date.dart';
import 'notifications_tile_scrollview.dart';

class NotificationsScrollView extends StatelessWidget {
  const NotificationsScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: NotificationsDate(
              date: 'This week',
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (BuildContext context, int index) {
                return const NotificationsTileScrollView();
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: NotificationsDate(
              date: 'This month',
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (BuildContext context, int index) {
                return const NotificationsTileScrollView();
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: NotificationsDate(
              date: 'Earlier',
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (BuildContext context, int index) {
                return const NotificationsTileScrollView();
              },
            ),
          ),
        ],
      ),
    );
  }
}
