import 'package:e_commerce_firebase/core/helpers/app_loaders.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/success_screen.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_images.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is SuccessVerifyAccountState ||
          current is SendEmailVerificationLoadingState ||
          current is SendEmailVerificationSuccessState ||
          current is SendEmailVerificationFailedState ||
          current is LogOutFailedState ||
          current is LogOutSuccessState ||
          current is LogOutLoadingState,
      listener: (context, state) {
        if (state is SendEmailVerificationFailedState) {
          AppLoaders.errorSnackBar(context, state.error);
        } else if (state is SendEmailVerificationSuccessState) {
          AppLoaders.successSnackBar(
              context, AppStrings.emailSent, AppStrings.emailSentSuccess);
        } else if (state is SuccessVerifyAccountState) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => SuccessScreen(
                    title: AppStrings.yourAccountCreatedTitle,
                    subTitle: AppStrings.yourAccountCreatedSubTitle,
                    onPressed: () => context.pushNamedAndRemoveUntil(
                        Routes.homeScreen,
                        predicate: (route) => false),
                    image: AppImages.successfullyRegisterAnimation),
              ),
              (route) => false);
        } else if (state is LogOutLoadingState) {
          AppLoaders.loading(context);
        } else if (state is LogOutSuccessState) {
          context.pushNamedAndRemoveUntil(Routes.loginScreen,
              predicate: (route) => false);
        } else if (state is LogOutFailedState) {
          AppLoaders.errorSnackBar(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
