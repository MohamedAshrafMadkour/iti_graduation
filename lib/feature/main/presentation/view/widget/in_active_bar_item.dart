import 'package:flutter/material.dart';
import 'package:iti_graduation/feature/main/data/models/bottom_bar_model.dart';

class InactiveBarItem extends StatelessWidget {
  const InactiveBarItem({super.key, required this.bottomBarModel});
  final BottomBarModel bottomBarModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(bottomBarModel.icon, color: Colors.grey, size: 30),
        Text(bottomBarModel.title, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
