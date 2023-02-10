import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class HomeStoriesScrollView extends StatelessWidget {
  const HomeStoriesScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      height: height * 0.2,
      width: width * 0.22,
      color: AppColors.black,
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 31,
            backgroundColor: AppColors.white,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            'je_elsayeed',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 11 * textScaleFactor,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
