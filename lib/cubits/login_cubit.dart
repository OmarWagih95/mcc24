import 'package:MCC/model/userModel.dart';
import 'package:MCC/services/FirebaseUserServices.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
   String? userID;
  String? email;
  String? passWord;
  GlobalKey <FormState> formKey=GlobalKey();
  String P='@';
  late RegExp regExp = RegExp(P);
  bool isSecured = true;
  final FirebaseAuth _auth =FirebaseAuth.instance;

  changeIsSecured(bool x){
    print(x);
    isSecured=x;
    print(isSecured);
    emit(LoginIsSecuredState());
  }

  login() async{
    print('fun sh8ala');
    emit(LoginLoadingState());
    try{
      print(email);
      print(passWord);
    FirebaseUserServices().login(email!, passWord!);
    emit(LoginSuccessState());
    }
    catch(e){
      emit(LoginFailureState(e.toString()));
    }
  }
}

