import 'package:flutter/material.dart';
import 'package:insta_clone/screens/base_screen.dart';
import 'package:insta_clone/screens/messages_screen.dart';
import 'package:insta_clone/screens/new_post_screen.dart';
import 'package:insta_clone/screens/notifications_screen.dart';
import 'package:provider/provider.dart';

import 'viewModel(changenotifier)/base_screen_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseScreenProvider>(
      create: (context) => BaseScreenProvider(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: const BaseScreen(),
            routes: {
              "newPostScreen": (context) => const NewPostScreen(),
              "notificationsScreen": (context) => const NotificationsScreen(),
              "messagesScreen": (context) => const MessagesScreen(),
            },
          );
        },
      ),
    );
  }
}
