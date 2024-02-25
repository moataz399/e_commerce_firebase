import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../data/models/product_model.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection(
      {super.key, required this.productModel, required this.headerTitle});

  final String headerTitle;
  final List<ProductModel> productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerTitle,
          style: TextStyles.font16BlackBoldSemiBold,
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.productsScreen, arguments: {
              "title": headerTitle,
              "productModel": productModel
            });
          },
          child: Text(
            "Show all",
            style: TextStyles.font12GreenRegular,
          ),
        ),
      ],
    );
  }
}
