import 'package:flutter/material.dart';

Widget categoryCard(BuildContext context, String title, String subtitle,
    {required Color color, required Color lightColor}) {
  return AspectRatio(
    aspectRatio: 6 / 8,
    child: Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: lightColor.withOpacity(.8),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -20,
              left: -20,
              child: CircleAvatar(
                backgroundColor: lightColor,
                radius: 60,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(title,
                        style: const TextStyle(
                          fontSize: 19.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(height: 5),
                  Flexible(
                    child: Text(subtitle,
                        style: const TextStyle(
                          fontSize: 16.8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
