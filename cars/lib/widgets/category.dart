import 'package:flutter/material.dart';

import 'categorycard.dart';

Widget category(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Category",
              style: TextStyle(
                fontSize: 19.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See All",
              style: const TextStyle(
                fontSize: 19.2,
                fontWeight: FontWeight.w500,
              ).copyWith(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .28,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            categoryCard(context, "Sedan", "350 + Cars",
                color: const Color(0xff4cd1bc),
                lightColor: const Color(0xff5ed6c3)),
            categoryCard(context, "Hatchback", "899 Cars",
                color: const Color(0xff71b4fb),
                lightColor: const Color(0xff7fbcfb)),
            categoryCard(context, "SUV", "500 + Cars",
                color: const Color(0xfffa8c73),
                lightColor: const Color(0xfffa9881)),
            categoryCard(context, "Coupe", "300 + Cars",
                color: const Color(0xff5ed6c3),
                lightColor: const Color(0xff5ed6c3)),
            categoryCard(context, "Roadster", "500 + Cars",
                color: const Color(0xff71b4fb),
                lightColor: const Color(0xff7fbcfb)),
          ],
        ),
      ),
    ],
  );
}
