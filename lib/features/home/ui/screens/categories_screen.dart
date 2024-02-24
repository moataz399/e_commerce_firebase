import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../widgets/category_screen_list_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyles.font18BlackBoldSemiBold,
              ),
              verticalSpace(16.h),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                clipBehavior: Clip.none,
                childAspectRatio: 1 / 1.2,
                children: List.generate(
                  10,
                  (index) => const CategoryScreenListItem(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
