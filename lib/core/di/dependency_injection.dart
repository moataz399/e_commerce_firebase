import 'package:dio/dio.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
}
