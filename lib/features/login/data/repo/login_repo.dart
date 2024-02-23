import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/exceptions/firebase_auth_exceptions.dart';
import '../../../../core/exceptions/firebase_exceptions.dart';
import '../../../../core/exceptions/platform_exceptions.dart';

class LoginRepo {
  final _auth = FirebaseAuth.instance;

  //! Login using email & password
  Future<void> loginWithEmailAndPassword(
      {required email, required String password}) async {
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
      throw 'Something went wrong, please try again later';
    }
  }

  //! SignIn With Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn().signIn(); // open popup
      // obtain the auth details from request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // creat a new credintial
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      return _auth.signInWithCredential(credential);
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

  //! forget Password
  Future<void> sendRmailResetPassord({required String email}) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
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
