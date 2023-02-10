import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/MessagesScreen/messages_appbar.dart';
import 'package:insta_clone/widgets/MessagesScreen/messages_scrollview.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(58),
        child: MessagesAppBar(),
      ),
      body: MessagesScrollView(),
    );
  }
}
