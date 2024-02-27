import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/my_orders/widgets/current_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "My Orders",
          style: TextStyles.font16BlackBoldSemiBold,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
          child: Column(
            children: [
              Container(
                height: 58.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(66.r),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffF4F5F6),
                    // Set the color of the border
                    width: 2.0, // Set the width of the border
                  ),
                ),
                child: TabBar(
                  splashBorderRadius: BorderRadius.circular(66.r),
                  dividerHeight: 0,
                  labelStyle: TextStyles.font14GreenMedium,
                  unselectedLabelStyle: TextStyles.font14BlackMedium,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  indicator: BoxDecoration(
                    color: const Color(0xff036832).withOpacity(.10),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  automaticIndicatorColorAdjustment: true,
                  tabs: const [
                    Tab(
                      text: "Current Orders",
                    ),
                    Tab(
                      text: "Past Orders",
                    ),
                  ],
                ),
              ),
              verticalSpace(21),
              const Expanded(
                child: TabBarView(children: [
                  CurrentOrdersList(),
                  CurrentOrdersList(),
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
