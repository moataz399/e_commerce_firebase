import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/banner_widget.dart';
import '../../../categories/ui/widgets/categories_section.dart';
import '../widgets/product_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
          child: Column(
            children: [
              verticalSpace(32),
              AppTextFormField(
                readOnly: true,
                contentPadding: EdgeInsets.only(top: 8.h, right: 12.w),
                onTap: () {
                  context.pushNamed(Routes.searchScreen);
                },
                hintText: "Search for product..",
                textStyle: TextStyles.font12BlackSemiBold,
                height: 40.h,
                hintStyle: TextStyles.font12GrayRegular,
                validator: (value) {},
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 20,
                ),
              ),
              verticalSpace(16.h),
              const BannersSlider(),
              verticalSpace(24.h),
              const CategoriesSection(),
              verticalSpace(24.h),
              ProductsSection(
                headerTitle: "Products",
                productModel: Constants.productList,
              ),
              verticalSpace(16.h),
              ProductsSection(
                headerTitle: "Flash Offers",
                productModel: Constants.flashOffersList,
              ),
              verticalSpace(16.h),
              ProductsSection(
                headerTitle: "Best Seller",
                productModel: Constants.bestSellerList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
