import 'package:flutter/material.dart';

import 'package:insta_clone/utils/colors.dart';

class NotificationsAppBar extends StatelessWidget {
  const NotificationsAppBar({
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
          'Notifications',
          style: TextStyle(
            fontSize: 18 * textScaleFactor,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
