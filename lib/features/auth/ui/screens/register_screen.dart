import 'dart:developer';

import 'package:e_commerce_firebase/core/helpers/app_regex.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/auth/data/models/register_model.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:e_commerce_firebase/features/auth/ui/widgets/logo_and_header_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/auth_question.dart';
import '../widgets/register_bloc_listener.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController;

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoAndHeaderText(
                    title: "Create an account",
                    emoji: "🎉",
                    img: "assets/images/logo.png",
                  ),
                  verticalSpace(25.h),
                  AppTextFormField(
                    hintText: "User name",
                    controller: userNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a valid name";
                      }
                    },
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      size: 20,
                    ),
                  ),
                  verticalSpace(25.h),
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
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                  ),
                  verticalSpace(25.h),
                  AppTextFormField(
                    hintText: "Phone number",
                    controller: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a valid phone number";
                      }
                    },
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      size: 20,
                    ),
                  ),
                  verticalSpace(25.h),
                  AppTextFormField(
                    controller: passwordController,
                    hintText: 'password',
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      size: 20,
                    ),
                    isObscureText: isObscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a valid password";
                      }
                    },
                  ),
                  verticalSpace(25.h),
                  AppTextFormField(
                    controller: passwordConfirmationController,
                    hintText: 'password Confirmation',
                    isObscureText: isObscureText,
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      size: 20,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a valid password";
                      }

                      if (passwordController.text !=
                          passwordConfirmationController.text) {
                        return "passwords don't match";
                      }
                    },
                  ),
                  verticalSpace(32.h),
                  AppTextButton(
                    buttonText: "Register",
                    textStyle: TextStyles.font15WhiteBold,
                    onPressed: () {
                      validateThenDoRegister(context);
                    },
                    buttonHeight: 56.h,
                    borderRadius: 16,
                  ),
                  verticalSpace(30.h),
                  Center(
                    child: AuthQuestion(
                      function: () {
                        context.pushReplacementNamed(Routes.loginScreen);
                      },
                      question: 'Already have an account? ',
                      page: "Login",
                    ),
                  ),
                  verticalSpace(30.h),
                  const RegisterBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (registerFormKey.currentState!.validate()) {
      context.read<AuthCubit>().register(
              registerModel: RegisterModel(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            userName: userNameController.text.trim(),
            phoneNumber: phoneNumberController.text.trim(),
          ));
      log("validated");
    }
  }
}
