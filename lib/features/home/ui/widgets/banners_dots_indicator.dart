import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
class BannersDotsIndicator extends StatelessWidget {
  const BannersDotsIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 16 : 8,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? AppColors.mainGreen : Colors.grey,
      ),
    );
  }
}