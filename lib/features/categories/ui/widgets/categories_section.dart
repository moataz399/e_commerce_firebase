import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/features/categories/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.categoryList});

  final List<CategoriesModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: categoryList.length,
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
                    context.pushNamed(Routes.categoryDetailsScreen, arguments: {
                      "items": categoryList[index].items,
                      "title": categoryList[index].title,
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 13.h),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 43.w,
                              height: 36.h,
                              child: CachedNetworkImage(
                                height: 90.h,
                                imageUrl: categoryList[index].image,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                  color: AppColors.mainGreen,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          categoryList[index].title,
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
