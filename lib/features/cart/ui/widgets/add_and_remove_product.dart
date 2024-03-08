import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class AddAndRemoveProduct extends StatelessWidget {
  const AddAndRemoveProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.remove_circle_outline),
        horizontalSpace(8),
        Text('1', style: TextStyles.font14BlackMedium),
        horizontalSpace(8),
        const Icon(Icons.add_circle_outline),
      ],
    );
  }
}