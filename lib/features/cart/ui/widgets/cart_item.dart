import 'package:e_commerce_firebase/features/cart/ui/widgets/add_and_remove_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_images.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127.h,
      width: 375.w,
      margin: EdgeInsets.only(bottom: 26.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: BorderDirectional(
              bottom: BorderSide(
                  width: 8.h, color: AppColors.lighterGray))),
      child: Padding(
        padding:
            EdgeInsets.only(right: 16.5.w, left: 16.5.w, bottom: 32.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image
            Image.asset(
              AppImages.hatImage,
              width: 149.w,
              height: 95.h,
            ),
            horizontalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Brown Bag', style: TextStyles.font14BlackBold),
                verticalSpace(8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '\$',
                          style: TextStyles.font14BlackRegular),
                      TextSpan(
                          text: '4.00',
                          style: TextStyles.font18GreenBold),
                    ],
                  ),
                ),
              ],
            ),
            horizontalSpace(32),
            const AddAndRemoveProduct()
          ],
        ),
      ),
    );
  }
}
