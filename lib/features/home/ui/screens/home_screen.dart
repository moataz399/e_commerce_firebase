import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    //GoogleSignIn googleUser = GoogleSignIn();
    return Scaffold(
      body: SafeArea(
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
          ],
        ),
      )),
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
