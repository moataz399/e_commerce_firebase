import 'package:e_commerce_firebase/core/functions/calculate_price.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/constants.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../data/models/product_model.dart';
import '../widgets/recommendation_product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 60.w,
                ),
                width: double.infinity,
                child: Image.network(
                  productModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productModel.title,
                    style: TextStyles.font18BlackBold,
                  ),
                ],
              ),
              verticalSpace(8),
              Row(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$",
                          style: TextStyles.font14GrayRegular,
                        ),
                        productModel.discountValue == 0
                            ? TextSpan(
                                text: productModel.price.toString(),
                                style: TextStyles.font14GreenBold,
                              )
                            : TextSpan(
                                text:
                                    "${calcPrice(productPrice: productModel.price, discountValue: productModel.discountValue)}",
                                style: TextStyles.font14GreenBold,
                              ),
                      ],
                    ),
                  ),
                  horizontalSpace(12),
                  productModel.discountValue == 0
                      ? const Text("")
                      : Text(
                          productModel.price.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough),
                        )
                ],
              ),
              verticalSpace(16),
              Text(
                "Description",
                style: TextStyles.font14DarkBlueSemiBold,
              ),
              verticalSpace(12),
              ReadMoreText(
                productModel.description,
                trimLines: 5,
                style: TextStyles.font14DarkBlueRegular,
                colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'More',
                trimExpandedText: 'Less',
                lessStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
                moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              verticalSpace(16),
              Text(
                "You might also like",
                style: TextStyles.font14DarkBlueSemiBold,
              ),
              verticalSpace(16),
              RecommendationProducts(
                productModel: cubit.productList,
                sameProductId: productModel.productId,
              ),
              verticalSpace(16),
              AppTextButton(
                  buttonText: "Add to Cart",
                  textStyle: TextStyles.font15WhiteBold,
                  onPressed: () {}),
              verticalSpace(24),
            ],
          ),
        ),
      )),
    );
  }
}
