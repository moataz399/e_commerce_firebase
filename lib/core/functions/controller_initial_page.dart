import 'package:e_commerce_firebase/core/di/dependency_injection.dart';
import 'package:e_commerce_firebase/core/helpers/cache_helper.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

String? controllerInitialPage(BuildContext context) {
   FlutterNativeSplash.remove();
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    if (user.emailVerified) {
      return Routes.homeScreen;
    } else {
      return Routes.verifyEmailScreen;
    }
  } else {
    final onBoardingValue =
        getIt<CacheHelper>().getData(key: AppStrings.onBoardingKey);
    if (onBoardingValue != null && onBoardingValue == true) {
      return Routes.loginScreen;
    }else{
       return Routes.onBoardingScreen;
    }
  }
}
