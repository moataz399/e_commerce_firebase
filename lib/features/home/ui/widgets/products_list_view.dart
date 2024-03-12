import 'package:e_commerce_firebase/features/home/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product_model.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.productModel});
 final List<ProductModel> productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228.h,
      child: ListView.builder(
          clipBehavior: Clip.none,
          itemCount: productModel.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ProductItem(productModel: productModel[index]),
            );
          }),
    );
  }
}
