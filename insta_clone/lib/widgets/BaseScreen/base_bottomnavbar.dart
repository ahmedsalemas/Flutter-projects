import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome_icons.dart';

import 'package:insta_clone/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../viewModel(changenotifier)/base_screen_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseScreenProvider>(
      builder: (context, provider, child) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            onTap: (index) => provider.setCurrentIndex(index),
            currentIndex: provider.getCurrentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.white,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                tooltip: '',
                icon: Icon(Icons.home_filled, size: 28),
                label: 'home',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: Icon(
                  FontAwesome.search,
                  size: 22,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: ImageIcon(
                  AssetImage('lib/utils/images/instagram-reels-icon.png'),
                ),
                label: 'Play',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: ImageIcon(
                  AssetImage('lib/utils/images/instagram-shop.png'),
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                tooltip: '',
                icon: CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.white,
                ),
                label: 'Circle',
              ),
            ],
          ),
        );
      },
    );
  }
}
