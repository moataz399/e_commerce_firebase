import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
   bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().loginFormKey,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
