import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  OrderCard({super.key});

  String status = "Delivered";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      child: Container(
        width: double.infinity,
        height: 190.h,
        decoration: BoxDecoration(
            color: const Color(0xffF4F5F6).withOpacity(.5),
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 88.w,
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      clipBehavior: Clip.none,
                      children: List.generate(
                        4,
                        (index) => Container(
                          width: 42.0.w,
                          height: 42.0.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/cap.png'),
                              // Provide the image path
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#483634",
                        style: TextStyles.font15BlackBold,
                      ),
                      verticalSpace(4),
                      Text(
                        "04:30 PM, 2 dec 2022 ",
                        style: TextStyles.font12BlackRegular,
                      ),
                      verticalSpace(16),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyles.font12DarkOrangeRegular,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xffF4F5F6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    16.r,
                  ),
                  bottomRight: Radius.circular(
                    16.r,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Details",
                      style: TextStyles.font14GreenMedium,
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.mainGreen,
                      size: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
