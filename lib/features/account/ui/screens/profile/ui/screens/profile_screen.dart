import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_back_button.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/profile/ui/widgets/cover_and_image.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/profile/ui/widgets/profile_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/widgets/app_icon_text_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  double profileHeight = 40.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCustomBackButton(),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CoverAndImage(),
            verticalSpace(16 + profileHeight),
            AppIconTextButton(
              buttonWidth: 120.w,
              buttonHeight: 44.h,
              borderRadius: 16.r,
              img: "assets/images/edit.png",
              imgColor: Colors.white,
              imgWidth: 16.w,
              imgHeight: 16.h,
              buttonText: "Edit Profile",
              textStyle: TextStyles.font12WhiteSemiBold,
              onPressed: () {
                context.pushNamed(Routes.editProfileScreen);
              },
              backgroundColor: AppColors.mainGreen,
            ),
            verticalSpace(30),
            ProfileInfo(),
          ],
        ),
      ),
    );
  }
}
