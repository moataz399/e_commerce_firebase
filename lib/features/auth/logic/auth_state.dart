abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailedState extends AuthState {
  final String error;

  RegisterFailedState({
    required this.error,
  });
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

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

class GoogleSignInDismissState extends AuthState {}

class GoogleSignInSuccessState extends AuthState {}

class GoogleSignInFailedState extends AuthState {
  final String error;

  GoogleSignInFailedState({
    required this.error,
  });
}

class SendEmailVerificationLoadingState extends AuthState {}

class SendEmailVerificationSuccessState extends AuthState {}

class SendEmailVerificationFailedState extends AuthState {
  final String error;

  SendEmailVerificationFailedState({
    required this.error,
  });
}

class SuccessVerifyAccountState extends AuthState {}

class LogOutLoadingState extends AuthState {}

class LogOutSuccessState extends AuthState {}

class LogOutFailedState extends AuthState {
  final String error;

  LogOutFailedState({
    required this.error,
  });
}


