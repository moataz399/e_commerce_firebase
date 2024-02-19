part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final user;

  RegisterSuccessState({required this.user});
}

class RegisterFailedState extends AuthState {
  final String error;

  RegisterFailedState({
    required this.error,
  });
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final user;

  LoginSuccessState({required this.user});
}

class LoginFailedState extends AuthState {
  final String error;

  LoginFailedState({
    required this.error,
  });
}

class ForgotPasswordLoadingState extends AuthState {}

class ForgotPasswordSuccessState extends AuthState {}

class ForgotPasswordFailedState extends AuthState {
  final String error;

  ForgotPasswordFailedState({
    required this.error,
  });
}

class GoogleSignInLoadingState extends AuthState {}

class GoogleSignInSuccessState extends AuthState {}

class GoogleSignInFailedState extends AuthState {
  final String error;

  GoogleSignInFailedState({
    required this.error,
  });
}
