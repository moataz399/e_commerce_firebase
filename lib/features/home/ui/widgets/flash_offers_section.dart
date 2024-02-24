import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';

class FlashOffersSection extends StatelessWidget {
  const FlashOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Flash Offers",
              style: TextStyles.font16BlackBoldSemiBold,
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.productsScreen);
              },
              child: Text(
                "Show all",
                style: TextStyles.font12GreenRegular,
              ),
            ),
          ],
        ),
        verticalSpace(16.h),
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
                  child: const ProductListItem(),
                );
              }),
        ),
        verticalSpace(16.h),
      ],
    );
  }
}
