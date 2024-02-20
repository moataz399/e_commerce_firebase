import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:e_commerce_firebase/features/auth/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_icon_Text_button.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/auth_question.dart';
import '../widgets/login_block_listener.dart';
import '../widgets/logo_and_header_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoAndHeaderText(
                  title: "Welcome back",
                  emoji: "👋",
                  img: "assets/images/logo.png",
                  width: 145.w,
                ),
                verticalSpace(32.h),
                const LoginForm(),
                verticalSpace(16.h),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.forgotPassword);
                  },
                  child: Text(
                    "Forgot password ?",
                    style: TextStyles.font12BlackRegular,
                  ),
                ),
                verticalSpace(32.h),
                AppTextButton(
                  buttonText: "Login ",
                  textStyle: TextStyles.font15WhiteBold,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                  buttonHeight: 56.h,
                  borderRadius: 16,
                ),
                verticalSpace(30.h),
                Center(
                  child: AuthQuestion(
                    function: () {
                      context.pushReplacementNamed(Routes.registerScreen);
                    },
                    question: "Don’t have an account ? ",
                    page: "Create one",
                  ),
                ),
                verticalSpace(100.h),
                AppIconTextButton(
                  buttonText: "Continue with Google",
                  textStyle: TextStyles.font14BlackRegular,
                  img: "assets/images/google.png",
                  onPressed: () {},
                ),
                verticalSpace(16.h),
                AppIconTextButton(
                  buttonText: "Continue with Facebook",
                  textStyle: TextStyles.font14BlackRegular,
                  img: "assets/images/facebook.png",
                  onPressed: () {},
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<AuthCubit>().loginFormKey.currentState!.validate()) {
      context.read<AuthCubit>().loginWithEmailAndPassword();
    }
  }
}
