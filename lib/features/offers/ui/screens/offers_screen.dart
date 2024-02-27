import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../home/data/models/product_model.dart';
import '../../../home/ui/widgets/product_list_item.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "offers",
                style: TextStyles.font18BlackBoldSemiBold,
              ),
              verticalSpace(16),
              AppTextFormField(
                readOnly: true,
                hintText: "Search for product..",
                validator: (value) {},
                onTap: () {
                  context.pushNamed(Routes.searchScreen);
                },
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
              verticalSpace(16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                clipBehavior: Clip.none,
                childAspectRatio: 1 / 1.2,
                children: List.generate(
                  10,
                  (index) => ProductListItem(
                    productModel: ProductModel(
                      image: "assets/images/hat.png",
                      title: "Product",
                      description:
                          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
                      price: 4,
                      productId: 1,
                      discountValue: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
