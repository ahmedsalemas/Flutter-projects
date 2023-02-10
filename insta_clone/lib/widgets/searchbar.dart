import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MessagesSearchBar extends StatelessWidget {
  const MessagesSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        width * 0.04,
        height * 0.015,
        width * 0.04,
        height * 0.011,
      ),
      child: Container(
        height: height * 0.045,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[850],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.01,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                'Search',
                style: TextStyle(
                  fontSize: 14 * textScaleFactor,
                  color: AppColors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
