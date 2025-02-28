import 'package:flutter/material.dart';
import 'package:parking_app/core/theme/Colors.dart';

class NavBarIcon extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;

  const NavBarIcon({
    super.key,
    required this.iconData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
        ),
        padding: const EdgeInsets.all(4),
        child: Icon(
          iconData,
          color: isSelected ? AppColors.goldColor : AppColors.blackColor,
        ));
  }
}
