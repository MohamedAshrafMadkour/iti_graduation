import 'package:flutter/material.dart';

class BottomBarModel {
  final String title;
  final IconData icon;

  BottomBarModel({required this.title, required this.icon});
  static List<BottomBarModel> bottomBarItemsList = [
    BottomBarModel(title: 'Search', icon: Icons.search),
    BottomBarModel(title: 'BookMark', icon: Icons.bookmark),
  ];
}
