import 'package:flutter/material.dart';

import 'package:insta_clone/utils/colors.dart';

class MessagesChatsScrollView extends StatelessWidget {
  const MessagesChatsScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return ListTile(
      leading: const CircleAvatar(
        radius: 23,
        backgroundColor: Color(0xff764abc),
        child: Text(''),
      ),
      title: Text(
        'yawzaofficial',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 12 * textScaleFactor,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              width: width * 0.5,
              child: Text(
                'We are sorry for the inconvenient',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                  fontSize: 12 * textScaleFactor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              '16h',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12 * textScaleFactor,
              ),
            ),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.camera_alt_outlined,
        color: AppColors.grey,
        size: 28,
      ),
    );
  }
}
