import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';

class CategoryScreenListItem extends StatelessWidget {
  const CategoryScreenListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163.w,
      height: 195.h,
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.categoryDetailsScreen);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 163.w,
              height: 163.h,
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 13.w),
              decoration: ShapeDecoration(
                color: const Color(0xFFF4F5F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Image.asset(
                "assets/images/hat.png",
                width: 100.w,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                'hat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF01040D),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
