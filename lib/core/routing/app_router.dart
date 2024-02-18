import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:e_commerce_firebase/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_firebase/features/auth/ui/screens/register_screen.dart';
import 'package:e_commerce_firebase/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/screens/home_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => AuthCubit(), child: const LoginScreen()),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => AuthCubit(), child: const RegisterScreen()),
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
