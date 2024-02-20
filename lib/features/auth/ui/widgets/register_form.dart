import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().registerFormKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "User name",
            controller: context.read<AuthCubit>().userNameController,
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
            controller: context.read<AuthCubit>().emailController,
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
            controller: context.read<AuthCubit>().phoneNumberController,
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
            controller: context.read<AuthCubit>().passwordController,
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
            controller:
                context.read<AuthCubit>().passwordConfirmationController,
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

              if (context.read<AuthCubit>().passwordController.text !=
                  context
                      .read<AuthCubit>()
                      .passwordConfirmationController
                      .text) {
                return "passwords don't match";
              }
            },
          ),
        ],
      ),
    );
  }
}
