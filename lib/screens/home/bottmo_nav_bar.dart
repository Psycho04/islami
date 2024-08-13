import 'package:flutter/material.dart';

class BottomNavBar extends BottomNavigationBarItem {
  BottomNavBar(String title, String iconPath, Color backgroundColor)
      : super(
            icon: ImageIcon(AssetImage(iconPath),size:35,),
            label: title,
            backgroundColor: backgroundColor);
}
