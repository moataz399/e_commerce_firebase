import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_icon_Text_button.dart';
import 'package:e_commerce_firebase/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_firebase/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Notifications"),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mainGreen10),
                          child: Center(
                            child: Image.asset(
                              'assets/images/notification.png',
                              width: 24.w,
                              height: 24.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        horizontalSpace(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Up To 50% Discount for all hats",
                              style: TextStyles.font14BlackMedium,
                            ),
                            verticalSpace(8),
                            Text(
                              "12 NOV 2023",
                              style: TextStyles.font12GrayRegular,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return CustomDivider();
                },
                itemCount: 20)
          ],
        ),
      )),
    );
  }
}
