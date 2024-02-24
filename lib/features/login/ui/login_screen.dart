import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce_firebase/features/login/ui/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_icon_Text_button.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/auth_question.dart';
import 'widgets/google_signin_block_listener.dart';
import 'widgets/login_block_listener.dart';
import '../../../core/widgets/logo_and_header_text.dart';

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
                verticalSpace(32),
                const LoginForm(),
                verticalSpace(5),
                InkWell(
                  onTap: () {
                    context.pushNamed(Routes.forgotPassword);
                  },
                  child: Text(
                    "Forgot password ?",
                    style: TextStyles.font12BlackRegular,
                  ),
                ),
                verticalSpace(32),
                AppTextButton(
                  buttonText: "Login ",
                  textStyle: TextStyles.font15WhiteBold,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                  buttonHeight: 56,
                  borderRadius: 16,
                ),
                verticalSpace(30),
                Center(
                  child: AuthQuestion(
                    function: () {
                      context.pushReplacementNamed(Routes.registerScreen);
                    },
                    question: "Don’t have an account ? ",
                    page: "Create one",
                  ),
                ),
                verticalSpace(150.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppIconTextButton(
                    buttonText: "Continue with Google",
                    textStyle: TextStyles.font14BlackRegular,
                    img: "assets/images/google.png",
                    onPressed: () {
                      context.read<LoginCubit>().signInWithGoogle();
                    },
                  ),
                ),
                const LoginBlocListener(),
                const GoogleSignInBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().loginFormKey.currentState!.validate()) {
      context.read<LoginCubit>().loginWithEmailAndPassword();
    }
  }
}
