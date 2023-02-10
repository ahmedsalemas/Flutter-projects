import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:insta_clone/utils/colors.dart';

class MessagesAppBar extends StatelessWidget {
  const MessagesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return AppBar(
      leadingWidth: width * 0.1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColors.black,
      title: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0, vertical: height * 0.01),
        child: Text(
          'ahmedd_salem',
          style: TextStyle(
            fontSize: 20 * textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0, vertical: height * 0.01),
              child: IconButton(
                iconSize: 23,
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                icon: const Icon(FontAwesome.plus_squared_alt),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0, vertical: height * 0.01),
              child: IconButton(
                iconSize: 23,
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                icon: const Icon(FontAwesome5.plus),
                onPressed: () => {},
              ),
            ),
            SizedBox(
              width: width * 0.012,
            )
          ],
        ),
      ],
    );
  }
}
