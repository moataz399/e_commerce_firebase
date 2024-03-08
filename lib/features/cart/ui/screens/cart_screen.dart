import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/cart_coupon_and_order_summry.dart';
import '../widgets/cart_item_list.dart';
import '../widgets/cart_title.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Cart ,Title
              const CartTitle(),
              verticalSpace(40),
              //! Carts,
              const CartItemList(),
              //! Add Coupon & Order Summry,
              const CartCouponAndOrderSummry(),
              verticalSpace(11),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}
