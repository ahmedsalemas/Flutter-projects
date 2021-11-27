import 'package:flutter/material.dart';

Widget searchField(BuildContext context) {
  return Container(
    height: 55,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(13)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0xffb8bfce),
          blurRadius: 15,
          offset: Offset(5, 5),
        )
      ],
    ),
    child: const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyle(
          fontSize: 16.8,
          fontWeight: FontWeight.w300,
          color: Color(0xffb9bfcd),
        ),
        suffixIcon: SizedBox(
            width: 50, child: Icon(Icons.search, color: Color(0xff8873f4))),
      ),
    ),
  );
}
