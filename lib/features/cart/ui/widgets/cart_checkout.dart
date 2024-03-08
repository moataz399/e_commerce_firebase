
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_text_button.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      height: 140.h,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lighterGray,
            blurRadius: 10,
            spreadRadius: 1.0,
            offset: Offset(0.0, 5.0),
          )
        ],
      ),
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('2 Items',style: TextStyles.font12GrayRegular),
               Text('\$ 20', style: TextStyles.font14GreenBold),
            ],
          ),
          verticalSpace(12),
          AppTextButton(buttonText: AppStrings.checkout, textStyle: TextStyles.font15WhiteBold, onPressed: () {
            
          },
          buttonHeight: 56,)
    
        ],
      ),
    );
  }
}