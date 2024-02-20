import 'package:e_commerce_firebase/core/helpers/app_loaders.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/auth_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginFailedState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainGreen,
              ),
            ),
          );
        } else if (state is LoginSuccessState) {
          context.pop();
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is LoginFailedState) {
          context.pop();
          AppLoaders.errorSnackBar(context, state.error);
          // showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     icon: const Icon(
          //       Icons.error,
          //       color: Colors.red,
          //       size: 32,
          //     ),
          //     content: Text(
          //       state.error.toString(),
          //       style: TextStyles.font15DarkBlueMedium,
          //       textAlign: TextAlign.center,
          //     ),
          //     actions: [
          //       TextButton(
          //         onPressed: () {
          //           context.pop();
          //         },
          //         child: Text(
          //           'Got it',
          //           style: TextStyles.font14BlueSemiBold,
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
