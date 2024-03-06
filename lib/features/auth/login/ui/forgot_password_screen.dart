import 'package:e_commerce_firebase/core/helpers/app_regex.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/core/widgets/logo_and_header_text.dart';
import 'package:e_commerce_firebase/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/forgot_password_bloc_listener.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 100.h),
          child: Form(
            key: context.read<LoginCubit>().forgetPasswordFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LogoAndHeaderText(
                  title: "ForgotPassword",
                  width: 163.w,
                ),
                verticalSpace(16),
                Text(
                  "Please enter the Email associated with your account",
                  style: TextStyles.font14GrayRegular
                      .copyWith(color: const Color(0xff8991A4)),
                ),
                verticalSpace(24),
                AppTextFormField(
                  hintText: "Email",
                  controller: context.read<LoginCubit>().email,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return "please enter a valid email";
                    }
                  },
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                verticalSpace(30),
                AppTextButton(
                  buttonText: "Send email",
                  buttonHeight: 56.h,
                  textStyle: TextStyles.font15WhiteBold,
                  onPressed: () {
                    validateThenSendPasswordResetEmail(context);
                  },
                ),
                const ForgotPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenSendPasswordResetEmail(BuildContext context) {
    if (context
        .read<LoginCubit>()
        .forgetPasswordFormKey
        .currentState!
        .validate()) {
      context.read<LoginCubit>().sendEmailResetPassword();
    }
  }
}
