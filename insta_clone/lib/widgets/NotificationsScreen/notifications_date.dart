import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class NotificationsDate extends StatelessWidget {
  const NotificationsDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        width * 0.04,
        height * 0.025,
        width * 0.04,
        height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15 * textScaleFactor,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
