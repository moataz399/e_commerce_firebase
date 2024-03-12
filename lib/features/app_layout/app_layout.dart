import 'package:e_commerce_firebase/features/app_layout/cubit/app_layout_cubit.dart';
import 'package:e_commerce_firebase/features/app_layout/cubit/app_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theming/colors.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      builder: (context, state) {
        var cubit = context.read<AppLayoutCubit>();
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.mainGreen,
            elevation: 15,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
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
      },
    );
  }
}
