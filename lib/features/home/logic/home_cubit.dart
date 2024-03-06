import 'package:bloc/bloc.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/account_screen.dart';
import 'package:e_commerce_firebase/features/categories/data/models/categories_model.dart';
import 'package:e_commerce_firebase/features/categories/ui/screens/categories_screen.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:e_commerce_firebase/features/home/data/repos/home_repo.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_firebase/features/offers/ui/screens/offers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../account/ui/screens/my_orders/screens/my_orders_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo _homeRepo;
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

  List<ProductModel> productList = [];
  List<CategoriesModel> categoriesList = [];

  Future getProductList() async {
    emit(ProductLoading());
    try {
      var response = await _homeRepo.getProductList();
      productList.addAll(response);
      emit(GetProductSuccess(productList: productList));
    } catch (e) {
      print(e.toString());
      emit(
        GetProductFailed(
          error: e.toString(),
        ),
      );
    }
  }

  Future getCategoriesList() async {
    emit(CategoriesLoading());
    try {
      var response = await _homeRepo.getCategoriesList();
      categoriesList.addAll(response);
      emit(GetCategoriesSuccess(productList: categoriesList));
    } catch (e) {
      print(e.toString());
      emit(
        GetCategoriesFailed(
          error: e.toString(),
        ),
      );
    }
  }
}
