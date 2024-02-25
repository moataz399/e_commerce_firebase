import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/widgets/success_screen.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:e_commerce_firebase/features/home/ui/app_layout.dart';
import 'package:e_commerce_firebase/features/categories/ui/screens/categories_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/product_details_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/products_screen.dart';
import 'package:e_commerce_firebase/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/categories/ui/screens/category_details_screen.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/forgot_password_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/register/logic/register_cubit.dart';
import '../../features/register/ui/screens/register_screen.dart';
import '../../features/register/ui/screens/verify_email_screen.dart';
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
      case Routes.productsDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final ProductModel productModel = args["productModel"];
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductDetailsScreen(
            productModel: productModel,
          ),
        );
      case Routes.categoryDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoryDetailsScreen(),
        );

      case Routes.productsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final List<ProductModel> productModel = args["productModel"];
        final String title = args["title"] as String;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductsScreen(
            title: title,
            productModel: productModel,
          ),
        );

      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<HomeCubit>(),
              child: const AppLayout()),
        );
      ///////////////////////////////////////////////////
      ///////////////////////////////////////////////////
      ///////////////////////////////////////////////////
      ///////////////////////////////////////////////////
      ///////////////////////////////////////////////////
      ///////////////////////////////////////////////////
      ///////////////////////////////////////////////////
      //Auth screens
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
            value: getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<LoginCubit>(), child: const LoginScreen()),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<LoginCubit>(), child: const ForgotPasswordScreen()),
        );

      case Routes.verifyEmailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<RegisterCubit>(), child: const VerifyEmailScreen()),
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
