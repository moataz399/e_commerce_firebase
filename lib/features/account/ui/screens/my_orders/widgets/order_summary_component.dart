import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class OrderSummaryComponent extends StatelessWidget {
  final String title;
  final String value;
  final bool isDiscount;

  const OrderSummaryComponent({
    Key? key,
    required this.title,
    required this.value,
    this.isDiscount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.font14BlackRegular),
        Text(value,
            style: isDiscount
                ? TextStyles.font14extraGreenRegular
                : TextStyles.font14GreyRegular),
      ],
    );
  }
}
