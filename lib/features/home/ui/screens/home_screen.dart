import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/banner_widget.dart';
import '../../../categories/ui/widgets/categories_section.dart';
import '../widgets/product_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              verticalSpace(16),
              const BannersSlider(),
              verticalSpace(24),
              CategoriesSection(
                categoryList: cubit.categoriesList,
              ),
              verticalSpace(24),
              ProductsSection(
                headerTitle: "Products",
                productModel: cubit.productList,
              ),
              verticalSpace(16),
              ProductsSection(
                headerTitle: "Flash Offers",
                productModel: cubit.productList,
              ),
              verticalSpace(16),
              ProductsSection(
                headerTitle: "Best Seller",
                productModel: cubit.productList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
