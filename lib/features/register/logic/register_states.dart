abstract class RegisterState {}

class AuthInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailedState extends RegisterState {
  final String error;

  RegisterFailedState({
    required this.error,
  });
}

class SendEmailVerificationLoadingState extends RegisterState {}

class SendEmailVerificationSuccessState extends RegisterState {}

class SendEmailVerificationFailedState extends RegisterState {
  final String error;

  SendEmailVerificationFailedState({
    required this.error,
  });
}

class SuccessVerifyAccountState extends RegisterState {}

class LogOutLoadingState extends RegisterState {}

class LogOutSuccessState extends RegisterState {}

class LogOutFailedState extends RegisterState {
  final String error;

  LogOutFailedState({
    required this.error,
  });
}


