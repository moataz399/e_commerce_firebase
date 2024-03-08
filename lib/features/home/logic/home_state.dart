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
class AddedToFav extends HomeState {}
class IsProductFavorite extends HomeState {}
class DeletedFromFav extends HomeState {}
class CheckFavoriteStatus extends HomeState {}
class ToggleFav extends HomeState {}

class GetFavSuccess extends HomeState {
  final  List<ProductModel> favList;

  GetFavSuccess({required this.favList});
}