import 'package:bloc/bloc.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/account_screen.dart';
import 'package:e_commerce_firebase/features/categories/ui/screens/categories_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_firebase/features/offers/ui/screens/offers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../account/ui/screens/my_orders/screens/my_orders_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List screens = const [
    HomeScreen(),
    CategoriesScreen(),
    MyOrdersScreen(),
    OffersScreen(),
    AccountScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;

    emit(ChangeBottomNav());
  }
}
