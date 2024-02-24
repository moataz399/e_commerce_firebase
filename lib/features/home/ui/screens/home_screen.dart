import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/best_seller_section.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/flash_offers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              AppTextFormField(
                hintText: "Search for product..",
                textStyle: TextStyles.font12BlackSemiBold,
                height: 40.h,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
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
              const ProductsSection(),
              verticalSpace(16.h),
              const FlashOffersSection(),
              verticalSpace(16.h),
              const BestSellerSection(),
            ],
          ),
        ),
      ),
    );
  }
}
