import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
        child: Column(
          children: [
            Center(
              child: Text("Home screen"),
            ),
            AppTextButton(
                buttonText: "logout",
                textStyle: TextStyles.font15WhiteBold,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  context.pushReplacementNamed(Routes.loginScreen);
                })
          ],
        ),
      )),
    );
  }
}
