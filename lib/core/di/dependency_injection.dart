import 'package:e_commerce_firebase/core/helpers/cache_helper.dart';
import 'package:e_commerce_firebase/features/home/data/repos/home_repo.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:e_commerce_firebase/features/register/logic/register_cubit.dart';
import 'package:e_commerce_firebase/features/login/data/repo/login_repo.dart';
import 'package:e_commerce_firebase/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/register/data/repo/register_repo.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Shared Preferences
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  //! Auth Cubit & Auth Repo


  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  //! Register Cubit & Register Repo
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo());
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  //! Login Cubit & Login Repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
