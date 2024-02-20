import 'package:e_commerce_firebase/core/services/firebase_firestore_services.dart';
import 'package:e_commerce_firebase/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../../../../core/exceptions/firebase_auth_exceptions.dart';
import '../../../../core/exceptions/firebase_exceptions.dart';
import '../../../../core/exceptions/format_exceptions.dart';
import '../../../../core/exceptions/platform_exceptions.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! Login using email & password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try agin later';
    }
  }

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
      throw 'Something went wrong, please try agin later';
    }
  }

  //! Save User data after registration
  Future<void> saveUserDataInFireStore(UserModel userModel) async {
    try {
      await FireStoreServices().addUserToFireStore(userModel);
    } on FormatException {
      throw const AppFormatException().message;
    }on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try agin later';
    }
  }
}
