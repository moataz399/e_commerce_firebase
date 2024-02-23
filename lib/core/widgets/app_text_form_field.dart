import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final double? height;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.height,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 80.h, // error
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: prefixIcon,
          isCollapsed: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.mainGreen,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.lighterGray,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? AppColors.moreLightGray,
          filled: true,
        ),
        obscureText: isObscureText ?? false,
        style: TextStyles.font14DarkBlueMedium,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
