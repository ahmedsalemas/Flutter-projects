import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MessagesNotesRow extends StatelessWidget {
  const MessagesNotesRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15 * textScaleFactor,
              color: AppColors.white,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '10',
                style: TextStyle(
                  fontSize: 15 * textScaleFactor,
                  color: AppColors.grey,
                ),
              ),
              IconButton(
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
                onPressed: () => {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
