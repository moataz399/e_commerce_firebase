import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingRoudedContainer extends StatelessWidget {
  const OnBoardingRoudedContainer({
    super.key, required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: 172.w,
      decoration: BoxDecoration(
          color: color.withOpacity(0.0),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color:  color.withOpacity(0.2),
                blurRadius: 50,
                spreadRadius: 20)
          ])
    );
  }
}