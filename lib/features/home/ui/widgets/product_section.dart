import 'package:e_commerce_firebase/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/product_model.dart';
import 'header_section.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection(
      {super.key, required this.headerTitle, required this.productModel});

  final String headerTitle;
  final List<ProductModel> productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          headerTitle: headerTitle,
          productModel: productModel,
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
                  child: ProductListItem(productModel: productModel[index]),
                );
              }),
        ),
        verticalSpace(16.h),
      ],
    );
  }
}
