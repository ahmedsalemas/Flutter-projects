import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/reels_screen.dart';
import '../screens/search_screen.dart';
import '../screens/shop_screen.dart';

class BaseScreenProvider extends ChangeNotifier {
  final _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const ShopScreen(),
    const ProfileScreen(),
  ];
  List<Widget> get getScreens => _screens;

  int _currentIndex = 0;
  int get getCurrentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
