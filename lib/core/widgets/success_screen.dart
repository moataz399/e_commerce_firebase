import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key, this.title, this.subTitle, this.image, this.onPressed});

  final String? title;
  final String? subTitle;
  final String? image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.h,
            bottom: 16.h,
            right: 16.h,
            left: 16.h,
          ),
          child: Column(
            children: [
              LottieBuilder.asset(
                image ?? '',
                width: HelperFunctions.screenWidth(context) * 0.6,
              ),
              verticalSpace(10),
              Text(
                title ?? "",
                style: TextStyles.font24BlackSemiBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(32),
              Text(subTitle ?? '',
                  style: TextStyles.font12BlackRegular,
                  textAlign: TextAlign.center),
              verticalSpace(32),
              AppTextButton(
                  buttonText: AppStrings.appContinue,
                  textStyle: TextStyles.font15WhiteBold,
                  onPressed: onPressed!),
            ],
          ),
        ),
      ),
    );
  }
}
