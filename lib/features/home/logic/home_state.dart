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

class GetProductFailed extends HomeState {}
