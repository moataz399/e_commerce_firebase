import 'package:e_commerce_firebase/core/di/dependency_injection.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/account_screen.dart';
import 'package:e_commerce_firebase/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:e_commerce_firebase/features/app_layout/cubit/app_layout_state.dart';
import 'package:e_commerce_firebase/features/cart/ui/screens/cart_screen.dart';
import 'package:e_commerce_firebase/features/categories/ui/screens/categories_screen.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_firebase/features/offers/ui/screens/offers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theming/colors.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentIndex = 0;

  List screens = [
    BlocProvider.value(
      key: UniqueKey(),
      value: getIt<HomeCubit>()
        ..getOffersList()
        ..getProductList()
        ..getCategoriesList(),
      child: const HomeScreen(),
    ),
    BlocProvider.value(
      key: UniqueKey(),
      value: getIt<HomeCubit>(),
      child: const CategoriesScreen(),
    ),
    const CartScreen(),
    BlocProvider.value(
      key: UniqueKey(),
      value: getIt<HomeCubit>(),
      child: const OffersScreen(),
    ),
    const AccountScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.mainGreen,
        elevation: 15,
        onTap: (index) {
          changeIndex(index);
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: "Offers",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
    );
  }
}
