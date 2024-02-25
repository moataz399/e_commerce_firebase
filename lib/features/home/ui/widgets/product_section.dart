import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/utils/constants.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/product_model.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection(
      {super.key, required this.headerTitle, required this.productModel});

  final String headerTitle;
  final List<ProductModel> productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headerTitle,
              style: TextStyles.font16BlackBoldSemiBold,
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.productsScreen, arguments: {
                  "title": headerTitle,
                  "productModel": productModel
                });
              },
              child: Text(
                "Show all",
                style: TextStyles.font12GreenRegular,
              ),
            ),
          ],
        ),
        verticalSpace(16.h),
        SizedBox(
          height: 204.h,
          child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: productModel.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ProductListItem(
                      productModel:productModel[index]),
                );
              }),
        ),
        verticalSpace(16.h),
      ],
    );
  }
}
