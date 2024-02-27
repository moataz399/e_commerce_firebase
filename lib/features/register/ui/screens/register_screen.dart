import 'dart:developer';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/features/register/logic/register_cubit.dart';
import 'package:e_commerce_firebase/core/widgets/logo_and_header_text.dart';
import 'package:e_commerce_firebase/features/register/ui/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/auth_question.dart';
import '../widgets/register_bloc_listener.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoAndHeaderText(
                  title: "Create an account",
                  emoji: "🎉",
                  img: "assets/images/logo.png",
                ),
                verticalSpace(25),
               const RegisterForm(),
                verticalSpace(32),
                AppTextButton(
                  buttonText: "Register",
                  textStyle: TextStyles.font15WhiteBold,
                  onPressed: () {
                    validateThenDoRegister(context);
                  },
                  buttonHeight: 56.h,
                  borderRadius: 16,
                ),
                verticalSpace(30),
                Center(
                  child: AuthQuestion(
                    function: () {
                      context.pushReplacementNamed(Routes.loginScreen);
                    },
                    question: 'Already have an account? ',
                    page: "Login",
                  ),
                ),
                verticalSpace(30),
                const RegisterBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().registerFormKey.currentState!.validate()) {
      context.read<RegisterCubit>().registerWithEmailAndPassword();
      log("validated");
    }
  }
}
