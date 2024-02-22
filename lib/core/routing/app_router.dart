import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/widgets/success_screen.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:e_commerce_firebase/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_firebase/features/auth/ui/screens/register_screen.dart';
import 'package:e_commerce_firebase/features/auth/ui/screens/verify_email/verify_email_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/category_details_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/caterories_screen.dart';
import 'package:e_commerce_firebase/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/ui/screens/forgot_password_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.categoryDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoryDetailsScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<AuthCubit>(), child: const LoginScreen()),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<AuthCubit>(), child: const ForgotPasswordScreen()),
        );
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<AuthCubit>(), child: const VerifyEmailScreen()),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.successScreen:
        return MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined to ${settings.name}'),
                  ),
                ));
    }
  }
}
