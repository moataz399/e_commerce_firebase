import 'package:e_commerce_firebase/core/helpers/app_loaders.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginFailureState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          AppLoaders.loading(context);
        } else if (state is LoginSuccessState) {
          context.pop();
          context.pushReplacementNamed(Routes.appLayout);
        } else if (state is LoginFailureState) {
          context.pop();
          AppLoaders.errorSnackBar(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
