part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final   user;

  RegisterSuccessState({required this.user});
}

class RegisterFailedState extends AuthState {
  final String error;

   RegisterFailedState({
    required this.error,
  });
}
