import 'package:flutter/material.dart';

PreferredSizeWidget appBar() {
  return AppBar(
    backgroundColor: Colors.white54,
    leading: const Icon(
      Icons.short_text,
      size: 30,
      color: Colors.blue,
    ),
    actions: const <Widget>[
      Icon(
        Icons.notifications_none,
        size: 30,
        color: Colors.blue,
      ),
    ],
  );
}
