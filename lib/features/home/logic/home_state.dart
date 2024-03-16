part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetProductLoadingState extends HomeState {}

class GetProductSuccessState extends HomeState {
  final List<ProductModel> productList;

  GetProductSuccessState({required this.productList});
}

class GetProductFailedState extends HomeState {
  final String error;

  GetProductFailedState({required this.error});
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

class GetCategoriesLoadingState extends HomeState {}

class GetCategoriesSuccess extends HomeState {
 final  List<CategoriesModel> productList;

  GetCategoriesSuccess({required this.productList});
}

class GetCategoriesFailed extends HomeState {
  final String error;

  GetCategoriesFailed({required this.error});
}
class AddedToFav extends HomeState {}
class AddedToCart extends HomeState {}
class AddingToCartLoadingState extends HomeState {}
class IsProductFavorite extends HomeState {}
class DeletedFromFav extends HomeState {}
class CheckFavoriteStatus extends HomeState {}
class ToggleFav extends HomeState {}

class GetFavSuccess extends HomeState {
  final  List<ProductModel> favList;

  GetFavSuccess({required this.favList});
}