import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class OnBoardPageViewItem extends StatelessWidget {
  final String img, title, description;

  const OnBoardPageViewItem(
      {super.key,
        required this.img,
        required this.title,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          height: 240.h,
          width: 300.w,
        ),
        verticalSpace(30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 55.w),
          child: SizedBox(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.font24BlackBold,
            ),
          ),
        ),
        verticalSpace(16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: SizedBox(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyles.font14GrayRegular,
            ),
          ),
        ),
      ],
    );
  }
}