import 'dart:async';

import 'package:e_commerce_firebase/features/auth/register/data/models/user_model.dart';
import 'package:e_commerce_firebase/features/auth/register/data/repo/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_states.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(AuthInitial());
  final RegisterRepo _authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  void registerWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    try {
      var user = await _authRepo.registerWithEmailAndPassword(
          emailController.text, passwordController.text);
      await _authRepo.saveUserDataInFireStore(UserModel(
          email: emailController.text.trim(),
          userName: userNameController.text.trim(),
          userId: user.user!.uid,
          phoneNumber: phoneNumberController.text.trim(),
          profilePicture: ''));

      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterFailedState(error: e.toString()));
    }
  }

  
  void sendEmailVerification() async {
    emit(SendEmailVerificationLoadingState());
    try {
      await _authRepo.sendEmailVerification();
      emit(SendEmailVerificationSuccessState());
    } catch (e) {
      emit(SendEmailVerificationFailedState(error: e.toString()));
    }
  }

  void setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        emit(SuccessVerifyAccountState());
      }
    });
  }

  /// Manually Check if email Verified
  checkEmailVerificationStatus() async {
    final currentUSer = FirebaseAuth.instance.currentUser;
    if (currentUSer != null && currentUSer.emailVerified) {
      emit(SuccessVerifyAccountState());
    }
  }

 /// user logout
  void logOut() async {
    emit(LogOutLoadingState());
    try {
      await _authRepo.logOut();
      emit(LogOutSuccessState());
    } catch (e) {
      emit(LogOutFailedState(error: e.toString()));
    }
  }

}
