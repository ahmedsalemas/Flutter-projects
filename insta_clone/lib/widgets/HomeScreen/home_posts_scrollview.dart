import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:insta_clone/utils/colors.dart';

class HomePostsScrollView extends StatelessWidget {
  const HomePostsScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      color: AppColors.black,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.06,
            child: ListTile(
              minLeadingWidth: 25,
              horizontalTitleGap: 8,
              contentPadding: EdgeInsets.fromLTRB(
                width * 0.03,
                height * 0,
                width * 0.03,
                height * 0,
              ),
              leading: const CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xff764abc),
                child: Text('ddd'),
              ),
              title: Text(
                'theglocal',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13 * textScaleFactor,
                ),
              ),
              trailing: const Icon(Icons.more_vert, color: AppColors.white),
            ),
          ),
          Container(
            width: double.infinity,
            height: width,
            decoration: const BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.contain,
                image: AssetImage('lib/utils/images/instagram-logo.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.015, height * 0.02, width * 0.015, height * 0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                  child: const Icon(
                    FontAwesome.heart_empty,
                    color: AppColors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                  child: const Icon(
                    FontAwesome.comment_empty,
                    color: AppColors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                  child: const Icon(
                    FontAwesome.paper_plane_empty,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: width * 0.525,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                  child: const Icon(
                    FontAwesome.bookmark_empty,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.015),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'makeupwithnouran',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13 * textScaleFactor,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    Text(
                      'Reviewing L\'oreal true match ',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 13 * textScaleFactor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
