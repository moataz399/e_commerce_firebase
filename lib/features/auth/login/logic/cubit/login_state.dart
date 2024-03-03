class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({required this.error});
}

class GoogleSignInLoadingState extends LoginState {}

class GoogleSignInSuccessState extends LoginState {}

class GoogleSignInFailureState extends LoginState {
  final String error;

  GoogleSignInFailureState({required this.error});
}

class SendEmailResetPasswordLoadingState extends LoginState {}

class SendEmailResetPasswordSuccessState extends LoginState {}

class SendEmailResetPasswordFailureState extends LoginState {
  final String error;

  SendEmailResetPasswordFailureState({required this.error});
}
