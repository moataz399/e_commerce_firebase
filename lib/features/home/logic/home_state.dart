part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNav extends HomeState {}

class ProductLoading extends HomeState {}

class GetProductSuccess extends HomeState {
  List<ProductModel> productList;

  GetProductSuccess({required this.productList});
}

class GetProductFailed extends HomeState {
  final String error;

  GetProductFailed({required this.error});
}

class CategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  List<CategoriesModel> productList;

  GetCategoriesSuccess({required this.productList});
}

class GetCategoriesFailed extends HomeState {
  final String error;

  GetCategoriesFailed({required this.error});
}
