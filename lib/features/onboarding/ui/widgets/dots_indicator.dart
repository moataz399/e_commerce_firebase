
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 48 : 24,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? AppColors.mainGreen : Colors.grey,
      ),
    );
  }
}