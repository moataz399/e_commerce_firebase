import 'package:e_commerce_firebase/core/helpers/cache_helper.dart';
import 'package:e_commerce_firebase/firebase_options.dart';
import 'package:e_commerce_firebase/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/app_router.dart';

Future<void> main() async {
 // test from moataz to abdo
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  CacheHelper.cacheInit();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Abdo Al hady
  runApp(MyApp(appRouter: AppRouter()));
}
