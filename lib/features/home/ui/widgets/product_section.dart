import 'package:e_commerce_firebase/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Products",
              style: TextStyles.font16BlackBoldSemiBold,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Show all",
                style: TextStyles.font12GreenRegular,
              ),
            ),
          ],
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
                (index) => const ProductListItem(),
          ),
        ),
      ],
    );
  }
}
