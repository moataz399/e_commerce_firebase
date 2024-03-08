import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/app_icon_text_button.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Addresses"),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: Color(0xffF4F5F6),
                            width: 1.0,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.mainGreen,
                                    size: 24,
                                  ),
                                  horizontalSpace(4),
                                  Text(
                                    "work",
                                    style: TextStyles.font14BlackMedium,
                                  ),
                                ],
                              ),
                              Image.asset('assets/images/edit.png',height: 20.h,width: 20.h,),
                            ],
                          ),
                          verticalSpace(8),
                          Text(
                            "Zamalek, Cairo Governorate, Egypt Street 132 geiza flower 4",
                            style: TextStyles.font12GrayRegular,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(8),
                          Text(
                            "Mobile Number: 010123456789",
                            style: TextStyles.font12GrayRegular,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            verticalSpace(16),
            AppIconTextButton(
                img: "assets/images/add.png",
                buttonText: "Add Address",
                textStyle: TextStyles.font12GreenRegular,
                onPressed: () {})
          ],
        ),
      )),
    );
  }
}
