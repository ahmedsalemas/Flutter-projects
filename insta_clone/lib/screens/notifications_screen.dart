import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/NotificationsScreen/notifications_appbar.dart';
import 'package:insta_clone/widgets/NotificationsScreen/notifications_scrollview.dart';

import '../widgets/BaseScreen/base_bottomnavbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: NotificationsAppBar(),
      ),
      body: const NotificationsScrollView(),
      bottomNavigationBar: SizedBox(
        height: height * 0.055,
        child: const BottomNavBar(),
      ),
    );
  }
}
