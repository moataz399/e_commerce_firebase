import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_strings.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: AppStrings.cart,
          style: TextStyles.font18BlackSemiBold,
        ),
         TextSpan(
          text:' ( 2 items )',
          style: TextStyles.font18GreyBold,
        ),
      ]),
    );
  }
}