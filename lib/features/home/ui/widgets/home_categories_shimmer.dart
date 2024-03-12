import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_effect.dart';

class HomeCategoriesShimmer extends StatelessWidget {
  const HomeCategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ShimmerEffet(
                width: 62.w,
                height: 62.h,
                raduis: 12,
              ),
              verticalSpace(10),
              ShimmerEffet(
                width: 50.w,
                height: 8.h,
                raduis: 0,
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpace(10);
        },
      ),
    );
  }
}
