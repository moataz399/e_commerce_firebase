import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffet extends StatelessWidget {
  const ShimmerEffet(
      {super.key,
      required this.width,
      required this.height,
      this.raduis = 15,
      this.color, this.baseColor, this.highlightColor});
  final double width, height, raduis;
  final Color? color,baseColor,highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:baseColor?? Colors.grey[200]!,
      highlightColor:highlightColor?? Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? AppColors.white,
            borderRadius: BorderRadius.circular(raduis)),
      ),
    );
  }
}
