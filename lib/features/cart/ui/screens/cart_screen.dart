import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/features/cart/ui/widgets/cart_item.dart';
import 'package:e_commerce_firebase/features/cart/ui/widgets/cart_title.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Cart Title
            const CartTitle(),
            verticalSpace(40),
            //! Carts,
            const CartItem(),
          ],
        ),
      ),
    );
  }
}
