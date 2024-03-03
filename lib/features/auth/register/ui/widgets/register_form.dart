import 'package:e_commerce_firebase/core/helpers/app_regex.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/features/auth/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
      key: context.read<RegisterCubit>().registerFormKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "User name",
            controller: context.read<RegisterCubit>().userNameController,
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
          verticalSpace(5),
          AppTextFormField(
            hintText: "Email",
            controller: context.read<RegisterCubit>().emailController,
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
          verticalSpace(5),
          AppTextFormField(
            hintText: "Phone number",
            controller: context.read<RegisterCubit>().phoneNumberController,
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
          verticalSpace(5),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
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
          verticalSpace(5),
          AppTextFormField(
            controller:
                context.read<RegisterCubit>().passwordConfirmationController,
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

              if (context.read<RegisterCubit>().passwordController.text !=
                  context
                      .read<RegisterCubit>()
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
