import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/utils/app_images.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:e_commerce_firebase/features/register/logic/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../widgets/verify_email_bloc_listener.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    context.read<RegisterCubit>().sendEmailVerification();
    context.read<RegisterCubit>().setTimerForAutoRedirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>context.read<RegisterCubit>().logOut(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Column(
            children: [
              Image.asset(AppImages.verifiyEmail),
              verticalSpace(15),
               Text(
                AppStrings.confirmEmail,
                textAlign: TextAlign.center,
                style: TextStyles.font24BlackSemiBold,
              ),
              verticalSpace(10),
              Text(
                context.read<RegisterCubit>().emailController.text,
                style: TextStyles.font12BlackRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(10),
              Text(
                AppStrings.confirmEmailSubTitle,
                style:  TextStyles.font12BlackRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(15),
              AppTextButton(
                buttonText: AppStrings.appContinue,
                textStyle: TextStyles.font15WhiteBold,
                onPressed: () =>
                    context.read<RegisterCubit>().checkEmailVerificationStatus(),
              ),
              verticalSpace(10),
              AppTextButton(
                buttonText: AppStrings.resendEmail,
                textStyle: TextStyles.font15WhiteBold
                    .apply(color: AppColors.mainGreen),
                backgroundColor: Colors.white,
                onPressed: () =>
                    context.read<RegisterCubit>().sendEmailVerification(),
              ),
              const VerifyEmailBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
