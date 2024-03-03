import 'package:e_commerce_firebase/core/helpers/app_regex.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
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
            prefixIcon: const Icon(
              Icons.email_outlined,
              size: 20,
            ),
          ),
          verticalSpace(10.h),
          AppTextFormField(
            controller: context.read<LoginCubit>().password,
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
