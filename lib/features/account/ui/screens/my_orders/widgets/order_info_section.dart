import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/text_styles.dart';

class OrderInfoSection extends StatelessWidget {
  OrderInfoSection({super.key});

  OrderStatus status = OrderStatus.canceled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Order ID - #483634",
                  style: TextStyles.font15BlackBold,
                ),
                Text(
                  "04:30 PM, 2 dec 2022 ",
                  style: TextStyles.font12BlackRegular,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: changeColor(status),
                borderRadius: BorderRadius.circular(35.r),
              ),
              child: Center(
                child: Text(status.name, style: changeTextColor(status)),
              ),
            )
          ],
        ),
        verticalSpace(26),
        Text(
          "Shipping to",
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: Color(0xffF4F5F6),
                width: 1.0,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.mainGreen,
                    size: 24,
                  ),
                  Text(
                    "work",
                    style: TextStyles.font14BlackMedium,
                  ),
                ],
              ),
              verticalSpace(8),
              Text(
                "Zamalek, Cairo Governorate, Egypt Street 132 geiza flower 4",
                style: TextStyles.font12GrayRegular,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(8),
              Text(
                "Mobile Number: 010123456789",
                style: TextStyles.font12GrayRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
