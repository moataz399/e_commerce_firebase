import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment method",
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: const Color(0xffF4F5F6),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cash On delivery",
                style: TextStyles.font14BlackRegular,
              ),
              const Icon(
                Icons.money,
                color: Colors.grey,
                size: 24,
              )
            ],
          ),
        ),
      ],
    );
  }
}
