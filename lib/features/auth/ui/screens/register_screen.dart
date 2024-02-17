import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../data/models/register_request_body.dart';
import '../../logic/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
