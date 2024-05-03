part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthCubitLoading extends AuthState {}

class AuthCubitSucces extends AuthState {}

class AuthCubitFailure extends AuthState {
  String errorMessage;
  AuthCubitFailure(this.errorMessage);
}

class AuthIsSecuredState extends AuthState {}

class AuthCubitVerificationLoading extends AuthState {
  String email;
  String userName;
  String phoneNumber;
  String Address;
  AuthCubitVerificationLoading(
      this.email, this.userName, this.phoneNumber, this.Address);
}

class AuthCubitVerificationSuccess extends AuthState {}

class AuthCubitVerificationfailure extends AuthState {}

class AuthCubitSignOutLoading extends AuthState {}

class AuthCubitSignOutSuccess extends AuthState {}

class AuthCubitSignOutFailure extends AuthState {
  String? errorMessage;
  AuthCubitSignOutFailure(this.errorMessage);
}
