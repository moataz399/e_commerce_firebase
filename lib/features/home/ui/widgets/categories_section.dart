import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                right: 8.w,
              ),
              child: SizedBox(
                width: 73.75.w,
                height: 86.h,
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.categoryDetailsScreen);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 13.h),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF4F5F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 43.w,
                              height: 36.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/hat.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
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
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
