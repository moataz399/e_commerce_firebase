import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/auth/ui/widgets/logo_and_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../logic/auth_cubit.dart';
import '../widgets/forgot_password_bloc_listener.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

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
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LogoAndHeaderText(
                  title: "ForgotPassword",
                  width: 163.w,
                ),
                verticalSpace(16.h),
                Text(
                  "Please enter the Email associated with your account",
                  style: TextStyles.font14GrayRegular
                      .copyWith(color: const Color(0xff8991A4)),
                ),
                verticalSpace(24.h),
                AppTextFormField(
                  hintText: "Email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return "please enter a valid email";
                    }
                  },
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                verticalSpace(30.h),
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
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().sendPasswordResetEmail(
            email: emailController.text.trim(),
          );
    }
  }
}
