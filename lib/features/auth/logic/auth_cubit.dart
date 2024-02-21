import 'dart:async';
import 'package:e_commerce_firebase/features/auth/data/models/user_model.dart';
import 'package:e_commerce_firebase/features/auth/data/repo/auth_repo.dart';
import 'package:e_commerce_firebase/features/auth/logic/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void registerWithEmailAndPassword() async {
    emit(RegisterLoadingState());
    try {
      var user = await _authRepo.registerWithEmailAndPassword(
          emailController.text, passwordController.text);
      await _authRepo.saveUserDataInFireStore(UserModel(
          email: emailController.text.trim(),
          userName: userNameController.text.trim(),
          userId: user.user!.uid,
          phoneNubmer: phoneNumberController.text.trim(),
          profilePicture: ''));

      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterFailedState(error: e.toString()));
    }
  }

  void loginWithEmailAndPassword() async {
    emit(LoginLoadingState());
    try {
      await _authRepo.loginWithEmailAndPassword(
          emailController.text, passwordController.text);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailedState(error: e.toString()));
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

  /// Manualy Check if email Verified
  checkEmailVerificationStatus() async {
    final currentUSer = FirebaseAuth.instance.currentUser;
    if (currentUSer != null && currentUSer.emailVerified) {
      emit(SuccessVerifyAccountState());
    }
  }

  void logOut() async {
    emit(LogOutLoadingState());
    try {
      await _authRepo.logOut();
      emit(LogOutSuccessState());
    } catch (e) {
      emit(LogOutFailedState(error: e.toString()));
    }
  }

  void sendPasswordResetEmail({required String email}) async {
    emit(ForgotPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgotPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      emit(
        ForgotPasswordFailedState(
          error: e.message!.toString(),
        ),
      );
    }
  }

  void signInWithGoogle() async {
    emit(GoogleSignInLoadingState());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(GoogleSignInDismissState());
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleSignInSuccessState());
    } catch (e) {
      print(e.toString());
      emit(
        GoogleSignInFailedState(
          error: e.toString(),
        ),
      );
    }
  }
}
