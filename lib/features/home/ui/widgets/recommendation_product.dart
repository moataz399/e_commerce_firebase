import 'package:e_commerce_firebase/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class RecommendationProducts extends StatelessWidget {
  const RecommendationProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 204.h,
          child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ProductListItem(),
                );
              }),
        ),
        verticalSpace(16),
      ],
    );
  }
}
