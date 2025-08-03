import 'package:flutter/material.dart';
import 'package:iti_graduation/feature/main/data/models/bottom_bar_model.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/active_and_in_active_bottom_item_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .08,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: BottomBarModel.bottomBarItemsList.asMap().entries.map((e) {
          int index = e.key;
          BottomBarModel data = e.value;
          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.onItemTapped(currentIndex);
              });
            },
            child: ActiveAndInActiveBottomBarItem(
              bottomBarModel: data,
              isActive: currentIndex == index,
            ),
          );
        }).toList(),
      ),
    );
  }
}
