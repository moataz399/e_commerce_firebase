import 'package:e_commerce_firebase/core/helpers/app_loaders.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/utils/app_images.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/success_screen.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is SendEmailResetPasswordLoadingState ||
          current is SendEmailResetPasswordSuccessState ||
          current is SendEmailResetPasswordFailureState,
      listener: (context, state) {
        if (state is SendEmailResetPasswordLoadingState) {
          AppLoaders.loading(context);
        } else if (state is SendEmailResetPasswordFailureState) {
          context.pop();
          AppLoaders.errorSnackBar(context, state.error);
        } else if (state is SendEmailResetPasswordSuccessState) {
          AppLoaders.successSnackBar(context, AppStrings.emailSent,
              AppStrings.frogetPasswordSuccessMessage);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SuccessScreen(
                  title: AppStrings.changeYourPasswordTitle,
                  subTitle: AppStrings.changeYourPasswordSubTitle,
                  image: AppImages.emailSent,
                  onPressed: () => context.pushNamedAndRemoveUntil(
                    Routes.loginScreen,
                    predicate: (route) => false,
                  ),
                ),
              ),
              (route) => false);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
