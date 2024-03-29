import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/features/cart/ui/widgets/cart_checkout.dart';
import 'package:flutter/material.dart';
import '../widgets/cart_coupon_and_order_summry.dart';
import '../widgets/cart_item_list.dart';
import '../widgets/cart_title.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Cart ,Title
              const CartTitle(),
              verticalSpace(40),
              //! Carts,
              const CartList(),
              //! Add Coupon & Order Summary,
              const CartCouponAndOrderSummry(),
              verticalSpace(11),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CartCheckout(),
    );
  }
}
