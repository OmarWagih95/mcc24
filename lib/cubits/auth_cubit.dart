import 'dart:async';

import 'package:MCC/model/userModel.dart';
import 'package:MCC/services/FirebaseUserServices.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';
final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  userModel? user;
  String? userID;
  String? userName;
  String? email;
  String? phoneNumber;
  String? passWord;
  String? address;
  bool isSecured = true;
  Timer? timer;
  GlobalKey <FormState> formKey=GlobalKey();
  String P='@';
  late RegExp regExp = RegExp(P);
  final FirebaseAuth _auth =FirebaseAuth.instance;

  changeIsSecured(bool x){
    print(x);
    isSecured=x;
    print(isSecured);
    emit(AuthIsSecuredState());
  }
  signUp()async{
    emit(AuthCubitLoading());
    try{
//sign up
     await  FirebaseUserServices().signUp(email, passWord, userName, phoneNumber, address).then((value) async{
       try{
         //b3dha yb3t verification email
         await FirebaseUserServices().sendVerificationEmail();

         }
         catch(e){}
       //hyro7 lsf7t alverification mstny alverification wbya5od ldata 3shan b3d alverification y7otha flfirestore
       emit(AuthCubitVerificationLoading(email!,userName!,phoneNumber!,address!));

     });
     // emit(Ver());
    }
    on FirebaseAuthException catch(e){
      if(e.code =='invalid-email'){
        emit(AuthCubitFailure('this email is invalid'));
      }
      else if(e.code == 'email-already-in-use') {
        emit(AuthCubitFailure('this email is invalid'));
      }
    }
        catch(e){
          emit(AuthCubitFailure('there was an error while signing up'));

        }
  }
  checkEmailVerified(String email,String userName,String phoneNumber,String address)async{
try{
//flverification screen bsh8l alfunction d t3ml check kol kam sanya l7d
//matrg3 true lma y3ml check
     var isVerified = await FirebaseUserServices().checkAccountIsVerified();
    if(isVerified){
      timer!.cancel();
      userID = await _auth.currentUser!.uid;
      print('tmaaaam');
      try{
        //bd5l aldata flfirestore users collection
        await usersCollection.doc(userID).set({
          'email': email,
          'userName': userName,
          'phoneNumber': phoneNumber,
          'address': address
        }).then((value) => print('success wldata tmaam wmsr btslm 3laik'));
      //   print(email);
      //   print(userName);
      //   print(phoneNumber);
      //   print(address);
      // await FirebaseUserServices().userInfo( email!, userName!, phoneNumber!, address!);
      }
      catch(e){
        print(e);
      }
      emit(AuthCubitVerificationSuccess());
    }
    else{
      print('lsa');
    }
}
catch(e){
  print(e);
}
  }
  signOut()async{
    emit(AuthCubitSignOutLoading());
    try{
      await FirebaseUserServices().signOut();
      emit(AuthCubitSignOutSuccess());
    }
    catch(e){
      emit(AuthCubitSignOutFailure(e.toString()));
      //hna whnaak

    }
  }

  Future <userModel?> getUserData()async{
    userModel? user =await FirebaseUserServices().getUserData();
    return user;
  }


}

