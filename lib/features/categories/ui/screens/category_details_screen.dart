import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/data/models/product_model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen(
      {super.key, required this.items, required this.title});

  final List<ProductModel> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                AppTextFormField(
                  readOnly: true,
                  onTap: () {
                    context.pushNamed(Routes.searchScreen);
                  },
                  hintText: "Search for product..",
                  validator: (value) {},
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                verticalSpace(16),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0.w,
                      mainAxisSpacing: 16.0.h,
                      mainAxisExtent: 230.h),
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) => ProductItem(
                    productModel: items[index],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
