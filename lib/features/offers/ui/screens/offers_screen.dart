import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../home/ui/widgets/product_item.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
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
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0.w,
                    mainAxisSpacing: 16.0.h,
                    mainAxisExtent: 225.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                itemCount: cubit.offersList.length,
                itemBuilder: (context, index) => ProductItem(
                  productModel: cubit.offersList[index],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
