import 'package:e_commerce_firebase/core/helpers/app_loaders.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/features/auth/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/register_states.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoadingState ||
          current is RegisterSuccessState ||
          current is RegisterFailedState,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          AppLoaders.loading(context);
        } else if (state is RegisterSuccessState) {
          context.pop();
          context.pushNamed(Routes.verifyEmailScreen);

          AppLoaders.successSnackBar(
              context, AppStrings.congratulation, AppStrings.registerSuccess);
        } else if (state is RegisterFailedState) {
          context.pop();
          AppLoaders.errorSnackBar(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
