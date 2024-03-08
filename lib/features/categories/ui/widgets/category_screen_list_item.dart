import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/features/categories/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';

class CategoryScreenListItem extends StatelessWidget {
  const CategoryScreenListItem({super.key, required this.categoryModel});

  final CategoriesModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163.w,
      height: 195.h,
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.categoryDetailsScreen, arguments: {
            "items": categoryModel.items,
            "title": categoryModel.title,
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 163.w,
              height: 163.h,
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 13.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1B1956).withOpacity(.04),
                    spreadRadius: 0,
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CachedNetworkImage(
                height: 100.h,
                width: 100.w,
                imageUrl:categoryModel.image,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.mainGreen,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: Text(
                categoryModel.title,
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
