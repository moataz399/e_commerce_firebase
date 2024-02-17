import 'package:e_commerce_firebase/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/app_router.dart';

void main() {
  setUpGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(appRouter: AppRouter()));
}
