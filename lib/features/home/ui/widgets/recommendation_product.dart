import 'package:e_commerce_firebase/features/home/ui/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/product_model.dart';

class RecommendationProducts extends StatelessWidget {
  const RecommendationProducts({super.key, required this.productModel,this.sameProductId});

  final List<ProductModel> productModel;

  final int?  sameProductId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220.h,
          child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: productModel.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ProductItem(
                    productModel: productModel[index],
                    sameProductId: sameProductId,
                  ),
                );
              }),
        ),
        verticalSpace(16),
      ],
    );
  }
}
