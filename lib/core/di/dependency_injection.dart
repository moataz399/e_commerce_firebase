import 'package:e_commerce_firebase/core/helpers/cache_helper.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  //! Shared Preferences
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  //! Auth Cubit & Auth Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

}
