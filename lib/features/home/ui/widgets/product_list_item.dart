import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/calculate_price.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.productModel});

  final ProductModel productModel;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.productsDetailsScreen,
            arguments: {"productModel": productModel});
      },
      child: Container(
        width: 164.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B1956).withOpacity(.04),
              spreadRadius: 0,
              blurRadius: 18,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  productModel.discountValue == 0
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.symmetric(),
                          width: 37.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xFFFF6264),
                          ),
                          child: Center(
                            child: Text(
                              "%${productModel.discountValue}",
                              style: TextStyles.font12WhiteSemiBold,
                            ),
                          ),
                        ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        print("fav tapped");
                      },
                      icon: const Icon(Icons.favorite_border_outlined,
                          size: 24, color: Colors.black)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: 125.w,
                height: 73.h,
                child: Image.asset(
                  productModel.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(13.h),
              Text(
                productModel.title ?? "",
                style: TextStyles.font14BlackRegular.copyWith(
                  color: const Color(0xFF01221D),
                ),
              ),
              verticalSpace(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  productModel.discountValue == 0
                      ? Text("\$${productModel.price.toString()}",
                          style: TextStyles.font14BlackBold)
                      : Text(
                          "\$${calcPrice(productPrice: productModel.price, discountValue: productModel.discountValue)}",
                          style: TextStyles.font14BlackBold),
                  horizontalSpace(6.w),
                  productModel.discountValue == 0
                      ? Container()
                      : Text(
                          "\$${productModel.price}",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
