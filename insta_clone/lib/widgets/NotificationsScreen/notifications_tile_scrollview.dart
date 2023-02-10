import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class NotificationsTileScrollView extends StatelessWidget {
  const NotificationsTileScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0,
        vertical: height * 0.012,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xff764abc),
          child: Text(''),
        ),
        title: RichText(
          overflow: TextOverflow.visible,
          text: TextSpan(
            text: 'islaam_elshantory ',
            style: TextStyle(
              fontSize: 13 * textScaleFactor,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'liked your comment: 3zamaaa❤❤❤ ',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13 * textScaleFactor,
                  color: AppColors.white,
                ),
              ),
              TextSpan(
                  text: '2 W',
                  style: TextStyle(
                    fontSize: 12 * textScaleFactor,
                    color: AppColors.grey,
                  )),
            ],
          ),
        ),
        trailing: Container(
          width: width * 0.11,
          height: height * 0.11,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/utils/images/instagram-logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
