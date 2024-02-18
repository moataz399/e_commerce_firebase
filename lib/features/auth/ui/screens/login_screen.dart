import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_icon_Text_button.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../widgets/already_have_an account.dart';
import '../widgets/logo_and_header_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController;

  final loginFormKey = GlobalKey<FormState>();
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
              key: loginFormKey,
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
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return "please enter a valid password";
                      }
                    },
                  ),
                  verticalSpace(16.h),
                  Text(
                    "Forgot password ?",
                    style: TextStyles.font12BlackRegular,
                  ),
                  verticalSpace(32.h),
                  AppTextButton(
                    buttonText: "Login ",
                    textStyle: TextStyles.font15WhiteBold,
                    onPressed: () {},
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
                  verticalSpace(30.h),
                  AppIconTextButton(
                    buttonText: "Continue with Google",
                    textStyle: TextStyles.font14BlackRegular,
                    img: "assets/images/google.png",
                    onPressed: () {},
                  ),
                  verticalSpace(30.h),
                  AppIconTextButton(
                    buttonText: "Continue with Facebook",
                    textStyle: TextStyles.font14BlackRegular,
                    img: "assets/images/facebook.png",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
