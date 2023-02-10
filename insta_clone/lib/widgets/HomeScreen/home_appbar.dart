import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:insta_clone/utils/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: AppColors.black,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.fromLTRB(
          width * 0.01,
          height * 0.02,
          width * 0.01,
          height * 0.01,
        ),
        child: Image.asset(
          'lib/utils/images/instagram-white.png',
          height: height * 0.27,
          width: width * 0.27,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.01,
            height * 0.02,
            width * 0.01,
            height * 0.01,
          ),
          child: Row(
            children: [
              IconButton(
                iconSize: 23,
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                icon: const Icon(FontAwesome.plus_squared_alt),
                onPressed: () => Navigator.pushNamed(context, "newPostScreen"),
              ),
              IconButton(
                iconSize: 23,
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                icon: const Icon(FontAwesome.heart_empty),
                onPressed: () =>
                    Navigator.pushNamed(context, "notificationsScreen"),
              ),
              IconButton(
                iconSize: 23,
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                icon: const Icon(FontAwesome5.facebook_messenger),
                onPressed: () => Navigator.pushNamed(context, "messagesScreen"),
              ),
              SizedBox(
                width: width * 0.012,
              )
            ],
          ),
        ),
      ],
    );
  }
}
