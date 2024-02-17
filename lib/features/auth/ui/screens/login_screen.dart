import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:e_commerce_firebase/features/auth/data/models/register_request_body.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                context.pushNamed(Routes.homeScreen);
              }
            },
            builder: (context, state) {
              return AppTextButton(
                onPressed: () {
                  LoginRequestBody loginRequestBody = LoginRequestBody(
                      email: "Moataz@gmail.com", password: "123456789");
                  BlocProvider.of<AuthCubit>(context)
                      .register(loginRequestBody: loginRequestBody);
                },
                buttonText: "register",
                textStyle: TextStyles.font24BlackBold,
              );
            },
          )),
        ],
      ),
    );
  }
}
