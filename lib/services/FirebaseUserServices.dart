import 'dart:developer';

import 'package:MCC/model/userModel.dart';
import 'package:MCC/views/verificationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserServices {
  String? userID;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  Future signUp(
    String? email,
    String? password,
    String? userName,
    String? phoneNumber,
    String? Address,
  ) async {
    await _auth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      if (value != null) {
        print('$value hna flmodel');
        log('$value hna flmodel');
        if (value.user != null) {
          print('mwgoood ya 3m');
          log('mwgoood ya 3m');
        } else {
          print('msh mwgoooud');
          log('msh mwgoooud');
        }
        print(value.user!.uid);
        log(value.user!.uid);
        userID = value.user!.uid;
      }
    });

    return true;
  }

  Future<bool> checkAccountIsVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    var user = await _auth.currentUser;
    print(user);
    var isVerified = user!.emailVerified;

    print(isVerified);
    if (isVerified) {
      return true;
    } else {
      return false;
    }
    // ممكن لاين واحد
    // return _auth.currentUser!.emailVerified;
  }

  Future sendVerificationEmail() async {
    final user = await _auth.currentUser;

    await user!.sendEmailVerification();
  }

  Future login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    var test = await _auth.currentUser!.uid;
    print('user $test');
  }

  Future signOut() async {
    await _auth.signOut();
  }

  Future<userModel> getUserData() async {
    String? userID = _auth.currentUser!.uid;
    print('$userID currentUser');
    var userData =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    print('$userID get user ahu');
    userModel user = userModel(userID, userData['email'], userData['userName'],
        userData['phoneNumber'], userData['address']);
    print('test ${user.userName}');
    return user;
  }
}
