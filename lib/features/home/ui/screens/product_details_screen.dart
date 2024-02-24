import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:e_commerce_firebase/core/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../widgets/recommendation_product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  "assets/images/hat.png",
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Brown Hat",
                    style: TextStyles.font18BlackBold,
                  ),
                ],
              ),
              verticalSpace(8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$",
                      style: TextStyles.font14GrayRegular,
                    ),
                    TextSpan(
                      text: "4.00",
                      style: TextStyles.font14GreenBold,
                    ),
                  ],
                ),
              ),
              verticalSpace(16),
              Text(
                "Description",
                style: TextStyles.font14DarkBlueSemiBold,
              ),
              verticalSpace(12),
              ReadMoreText(
                'Find both comfort and sophisticated style among our selection of furniture.Find both comfort and sophisticated style among our selection of furniture.Find both comfort and sophisticated style among our selection of furniture.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
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
              RecommendationProducts(),
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
