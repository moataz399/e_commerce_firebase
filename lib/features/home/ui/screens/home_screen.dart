import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/banner_widget.dart';
import '../widgets/categories_section.dart';
import '../widgets/product_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
          child: Column(
            children: [
              AppTextFormField(
                hintText: "Search for product..",
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
            ],
          ),
        )),
      ),
    );
  }
}

// AppTextButton(
//     buttonText: "logout",
//     textStyle: TextStyles.font15WhiteBold,
//     onPressed: () async {
//       if (await googleUser.isSignedIn()) {
//         await googleUser.disconnect();
//       }
//       await FirebaseAuth.instance.signOut();
//       context.pushReplacementNamed(Routes.loginScreen);
//     }),
