import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/my_orders/widgets/order_info_section.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/my_orders/widgets/order_product_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/order_summary_section.dart';
import '../widgets/payment_methods_section.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order Details",
        style: TextStyles.font16BlackSemiBold,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderInfoSection(),
                verticalSpace(30),
                OrderSummarySection(),
                verticalSpace(30),
                PaymentMethodsSection(),
                verticalSpace(30),
                OrderProductsSection(),
                verticalSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
