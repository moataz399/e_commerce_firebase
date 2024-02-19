import 'package:bloc/bloc.dart';
import 'package:e_commerce_firebase/features/auth/data/models/register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({required RegisterModel registerModel}) async {
    emit(RegisterLoadingState());
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: registerModel.email, password: registerModel.password);

      emit(RegisterSuccessState(user: user));
    } catch (e) {
      print(e.toString());
      emit(RegisterFailedState(error: e.toString()));
    }
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccessState(user: user));
    } catch (e) {
      print(e.toString());
      emit(LoginFailedState(error: e.toString()));
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
          error: e.message.toString(),
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
