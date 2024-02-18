import 'package:bloc/bloc.dart';
import 'package:e_commerce_firebase/features/auth/data/models/register_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({required LoginRequestBody loginRequestBody}) async {
    emit(RegisterLoadingState());
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginRequestBody.email, password: loginRequestBody.password);

      emit(RegisterSuccessState(user: user));
    } catch (e) {
      print(e.toString());
      emit(RegisterFailedState(error: e.toString()));
    }
  }
}
