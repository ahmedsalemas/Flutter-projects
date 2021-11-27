import 'package:flutter/material.dart';

Widget header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Hello,",
              style: TextStyle(fontSize: 19.2),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text("Ahmed Salem",
                  style:
                      TextStyle(fontSize: 33.6, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.asset("assets/user.png", fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    ),
  );
}
