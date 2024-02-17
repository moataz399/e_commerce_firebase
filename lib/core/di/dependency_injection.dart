import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = await DioFactory.getDio();
}
