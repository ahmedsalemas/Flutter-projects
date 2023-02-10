import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MessagesMessagesRow extends StatelessWidget {
  const MessagesMessagesRow({
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
        height * 0.01,
        width * 0.02,
        height * 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Messages',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15 * textScaleFactor,
              color: AppColors.white,
            ),
          ),
          TextButton(
            onPressed: () => {},
            child: Text(
              'Requests',
              style: TextStyle(
                fontSize: 15 * textScaleFactor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
