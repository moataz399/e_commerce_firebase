import 'package:flutter/material.dart';

import '../theming/text_styles.dart';

class AuthQuestion extends StatelessWidget {
   const AuthQuestion({super.key,required this.function,required this.question,required this.page});

   final String question ;
   final String page;
   final void Function() function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: question,
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: page,
              style: TextStyles.font14GreenSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
