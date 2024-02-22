import 'package:e_commerce_firebase/core/helpers/cache_helper.dart';
import 'package:e_commerce_firebase/firebase_options.dart';
import 'package:e_commerce_firebase/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/app_router.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();
  await getIt<CacheHelper>().init();

  Bloc.observer = MyBlocObserver();

  /// --- await splash screen until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(appRouter: AppRouter()));
}
