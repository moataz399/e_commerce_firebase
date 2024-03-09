import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/constants.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProductsSection extends StatelessWidget {
  const OrderProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Products",
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(16),
        SizedBox(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: Constants.productList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: SizedBox(
                    height: 200.h,
                    child: ProductItem(
                        productModel: Constants.productList[index]),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
