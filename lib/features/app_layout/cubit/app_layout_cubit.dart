import 'package:e_commerce_firebase/features/app_layout/cubit/app_layout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account/ui/screens/account_screen.dart';
import '../../cart/ui/screens/cart_screen.dart';
import '../../categories/ui/screens/categories_screen.dart';
import '../../home/ui/screens/home_screen.dart';
import '../../offers/ui/screens/offers_screen.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitial());

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
