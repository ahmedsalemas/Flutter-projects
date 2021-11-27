import 'package:cars/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cars',
      debugShowCheckedModeBanner: false,
      theme: themedata,
      home: const SplashScreen(),
    );
  }
}
