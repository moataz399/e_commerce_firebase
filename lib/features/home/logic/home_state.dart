part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNav extends HomeState {}

class ProductLoading extends HomeState {}

class GetProductSuccess extends HomeState {
  final List<ProductModel> productList;

  GetProductSuccess({required this.productList});
}

class GetProductFailed extends HomeState {
  final String error;

  GetProductFailed({required this.error});
}

class OffersLoading extends HomeState {}

class GetOffersSuccess extends HomeState {
 final  List<ProductModel> offersList;

  GetOffersSuccess({required this.offersList});
}

class GetOffersFailed extends HomeState {
  final String error;

  GetOffersFailed({required this.error});
}

class CategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
 final  List<CategoriesModel> productList;

  GetCategoriesSuccess({required this.productList});
}

class GetCategoriesFailed extends HomeState {
  final String error;

  GetCategoriesFailed({required this.error});
}
