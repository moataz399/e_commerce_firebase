import 'package:e_commerce_firebase/core/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/text_styles.dart';

class ProductListShimmer extends StatelessWidget {
  const ProductListShimmer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(16),
        SizedBox(
          height: 228.h,
          child: ListView.separated(
            
              clipBehavior: Clip.none,
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => horizontalSpace(10),
              itemBuilder: (context, index) {
                return ShimmerEffet(width: 164.w, height: 228.h);
              }),
        ),
      ],
    );
  }
}
