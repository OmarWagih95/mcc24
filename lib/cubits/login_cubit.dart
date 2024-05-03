import 'package:MCC/services/FirebaseUserServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String? userID;
  String? email;
  String? passWord;
  GlobalKey<FormState> formKey = GlobalKey();
  String P = '@';
  late RegExp regExp = RegExp(P);
  bool isSecured = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  changeIsSecured(bool x) {
    debugPrint('$x');
    isSecured = x;
    debugPrint('$isSecured');
    emit(LoginIsSecuredState());
  }

  login() async {
    debugPrint('fun sh8ala');
    emit(LoginLoadingState());
    try {
      debugPrint(email);
      debugPrint(passWord);
      await FirebaseUserServices().login(email!, passWord!);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
