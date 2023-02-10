import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class MessagesNotesScrollView extends StatelessWidget {
  const MessagesNotesScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: width * 0.35,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          width * 0.035,
          height * 0,
          width * 0.04,
          height * 0.01,
        ),
        child: Column(
          children: [
            ListTile(
              minLeadingWidth: 25,
              horizontalTitleGap: 7,
              contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0,
              ),
              leading: const CircleAvatar(
                backgroundColor: Color(0xff764abc),
                radius: 13,
                child: Text(''),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'hussein_mohamed',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13 * textScaleFactor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '16 h',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 13 * textScaleFactor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Who\'s at wegz fanpit?',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14 * textScaleFactor,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
