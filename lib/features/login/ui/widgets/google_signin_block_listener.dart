import 'package:e_commerce_firebase/core/helpers/app_loaders.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';

class GoogleSignInBlocListener extends StatelessWidget {
  const GoogleSignInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is GoogleSignInLoadingState ||
          current is GoogleSignInSuccessState ||
          current is GoogleSignInFailureState,
      listener: (context, state) {
        if (state is GoogleSignInLoadingState) {
          AppLoaders.loading(context);
        } else if (state is GoogleSignInSuccessState) {
          context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (Route<dynamic> route) => false,
          );
        } else if (state is GoogleSignInFailureState) {
          context.pop();
          AppLoaders.errorSnackBar(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
