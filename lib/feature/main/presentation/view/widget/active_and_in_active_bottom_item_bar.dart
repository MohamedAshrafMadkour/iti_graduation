import 'package:flutter/material.dart';
import 'package:iti_graduation/feature/main/data/models/bottom_bar_model.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/active_bar_item.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/in_active_bar_item.dart';

class ActiveAndInActiveBottomBarItem extends StatelessWidget {
  const ActiveAndInActiveBottomBarItem({
    super.key,
    required this.isActive,
    required this.bottomBarModel,
  });
  final bool isActive;
  final BottomBarModel bottomBarModel;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.bounceInOut,
      secondCurve: Curves.bounceInOut,
      firstChild: InactiveBarItem(bottomBarModel: bottomBarModel),
      secondChild: ActiveBarItem(bottomBarModel: bottomBarModel),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
