part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginFailureState extends LoginState {
  String errorMessage;
  LoginFailureState(this.errorMessage);
}
class LoginIsSecuredState extends LoginState {}
