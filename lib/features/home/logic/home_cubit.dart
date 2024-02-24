import 'package:bloc/bloc.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/account_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/cart_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/categories_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/offers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    OffersScreen(),
    AccountScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;

    emit(ChangeBottomNav());
  }
}
