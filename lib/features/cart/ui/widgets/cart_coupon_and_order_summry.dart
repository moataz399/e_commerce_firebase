import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class CartCouponAndOrderSummry extends StatelessWidget {
  const CartCouponAndOrderSummry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: AppStrings.addCoupon,
            validator: (value) {},
            prefixIcon: const Icon(AppIcons.coupon),
            suffixIcon: TextButton(
              style: TextButton.styleFrom(foregroundColor: AppColors.mainGreen),
              onPressed: () {},
              child: const Text(AppStrings.apply),
            ),
          ),
          verticalSpace(24),
          Text(
            AppStrings.orderSummary,
            style: TextStyles.font16BlackBoldBold,
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.subTotal, style: TextStyles.font14BlackRegular),
              Text('\$ 40', style: TextStyles.font14GrayRegular)
            ],
          )
        ],
      ),
    );
  }
}
