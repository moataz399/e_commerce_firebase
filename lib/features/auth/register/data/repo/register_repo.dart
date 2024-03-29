import 'package:e_commerce_firebase/core/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_firebase/core/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_firebase/core/exceptions/format_exceptions.dart';
import 'package:e_commerce_firebase/core/exceptions/platform_exceptions.dart';
import 'package:e_commerce_firebase/core/services/firebase_firestore_services.dart';
import 'package:e_commerce_firebase/features/auth/register/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';


class RegisterRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! Register using email & password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later';
    }
  }

  //! Save User data after registration
  Future<void> saveUserDataInFireStore(UserModel userModel) async {
    try {
      await FireStoreServices().addUserToFireStore(userModel);
    } on FormatException {
      throw const AppFormatException().message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later';
    }
  }

  //! Send  email verification to verify account
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later';
    }
  }
  //! user logout
    Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later';
    }
  }
}
