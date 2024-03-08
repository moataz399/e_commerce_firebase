import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase/core/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_firebase/core/exceptions/platform_exceptions.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/account_screen.dart';
import 'package:e_commerce_firebase/features/categories/data/models/categories_model.dart';
import 'package:e_commerce_firebase/features/categories/ui/screens/categories_screen.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:e_commerce_firebase/features/home/data/repos/home_repo.dart';
import 'package:e_commerce_firebase/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce_firebase/features/offers/ui/screens/offers_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<ProductModel> offersList = [];
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

  Future getOffersList() async {
    emit(OffersLoading());
    try {
      var response = await _homeRepo.getOffersList();
      offersList.addAll(response);
      emit(GetOffersSuccess(offersList: offersList));
    } catch (e) {
      print(e.toString());
      emit(
        GetOffersFailed(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> addFavoriteProduct(ProductModel product) async {
    try {
      await _homeRepo.addFavoriteProduct(product);
      print("added ${product.productId}");
      emit(AddedToFav());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> isProductFavorite(ProductModel product) async {
    try {
      var isFav = await _homeRepo.isProductFavorite(product);
      return isFav;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeFavoriteProduct(ProductModel product) async {
    try {
      await _homeRepo.removeFavoriteProduct(product);
      print("deleted ${product.productId}");
      emit(DeletedFromFav());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> fetchUserFavorites() async {
    try {
      var favList = await _homeRepo.fetchUserFavorites();
      emit(GetFavSuccess(favList: favList));

      return favList;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Stream<List<ProductModel>> listenToFavorites() {
    return _homeRepo.listenToFavorites();
  }

  // late bool isFavorite ;
  //
  // void checkFavoriteStatus(ProductModel product) async {
  //   bool result = await isProductFavorite(product);
  //
  //   isFavorite = result;
  //   emit(CheckFavoriteStatus());
  // }
  //
  // void toggleFavoriteStatus(ProductModel product) async {
  //   if (isFavorite) {
  //     // If currently a favorite, remove it
  //     await removeFavoriteProduct(product);
  //   } else {
  //     // If not a favorite, add it
  //     await addFavoriteProduct(product);
  //   }
  //   // Then update the state to reflect the change
  //
  //   isFavorite = !isFavorite;
  //   emit(ToggleFav());
  // }
}
