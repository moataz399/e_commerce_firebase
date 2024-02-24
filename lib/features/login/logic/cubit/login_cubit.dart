import 'package:e_commerce_firebase/core/services/firestore_service.dart';
import 'package:e_commerce_firebase/features/register/data/models/user_model.dart';
import 'package:e_commerce_firebase/features/login/data/repo/login_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginInitial());
  final LoginRepo _repo;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //! login with email and password
  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoadingState());
    try {
      await _repo.loginWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(error: e.toString()));
    }
  }

  //! SignIn with Google Account
  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoadingState());
    try {
      final user = await _repo.signInWithGoogle();
      final newUser = UserModel(
        email: user.user!.email ?? '',
        userName: user.user!.displayName ?? '',
        userId: user.user!.uid,
        phoneNumber: user.user!.phoneNumber ?? '',
        profilePicture: user.user!.photoURL ?? '',
      );
      final db = FireStoreServices.instance;
      await db.setData(path: 'users/${user.user!.uid}', data: newUser.toJson());
      emit(GoogleSignInSuccessState());
    } catch (e) {
      emit(GoogleSignInFailureState(error: e.toString()));
    }
  }

  //! Forget Password
  void sendEmailResetPasswrd() async {
    emit(SendEmailResetPasswordLoadingState());
    try {
      await _repo.sendRmailResetPassord(email: email.text.trim());
      emit(SendEmailResetPasswordSuccessState());
      
    } catch (e) {
      emit(SendEmailResetPasswordFailureState(error: e.toString()));
    }
  }
}
