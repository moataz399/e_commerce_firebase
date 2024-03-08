
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helpers/spacing.dart';
import 'order_summary_component.dart';
class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order summary",
          style: TextStyles.font16BlackSemiBold,
        ),
        verticalSpace(16),
        const OrderSummaryComponent(title: 'Sub Total', value: '\$ 40'),
        const SizedBox(height: 8.0),
        const OrderSummaryComponent(
            title: 'Delivery Fee', value: '\$ 20'),
        const SizedBox(height: 8.0),
        const OrderSummaryComponent(
          title: 'Discount (Peak 50)',
          value: '\$ 20\-',
          isDiscount: true,
        ),
        verticalSpace(16),
        CustomDivider(),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Amount",
              style: TextStyles.font14BlackBold,
            ),
            Text(
              "\$20.00",
              style: TextStyles.font20BlackBold,
            ),
          ],
        ),
      ],
    );
  }
}
