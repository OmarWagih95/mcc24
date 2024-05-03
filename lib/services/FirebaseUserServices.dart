import 'package:MCC/model/userModel.dart';
import 'package:MCC/views/verificationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseUserServices{
  String? userID ;
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  Future signUp(String? email, String? password, String?userName , String? phoneNumber
      ,String? Address,)async{
    // try{
    await _auth.createUserWithEmailAndPassword(email: email!, password: password!).then((value){
      if (value != null) {
        debugPrint('$value hna flmodel');
        if(value.user! !=null){
          debugPrint('mwgoood ya 3m');
        }
        else{
          debugPrint('msh mwgoooud');
        }
        debugPrint(value.user!.uid);
         userID = value.user!.uid;
        // userController.userID=userID;


      }
    } );

    // }
    // catch(e){
    //   debugPrint(e);
    // }
    // debugPrint('done');
    return true;
  }
   Future<bool> checkAccountIsVerified()async{
     await FirebaseAuth.instance.currentUser!.reload();

     var user =await _auth.currentUser;
    debugPrint ('$user');
    var isVerified = user!.emailVerified;

    debugPrint('$isVerified');
    if (isVerified) {
return true;
    }
    else{
return false;
      // await sendVerificationEmail();

      // Get.toNamed(verificationScreenRoute);
    }
  }
  Future sendVerificationEmail()async{
    final user =await _auth.currentUser;


    await user!.sendEmailVerification();
    // userInfo(userID);

  }
 // Future userInfo (String email,String userName,String phoneNumber, String address )async{
 //    debugPrint('asht8lttttttt');
 //    debugPrint(email);debugPrint(userName);debugPrint(phoneNumber);debugPrint(address);
 //    debugPrint(userID);
 //    debugPrint('here');
 //    await usersCollection.doc('1').set({
 //      'email': email!,
 //      'userName': userName!,
 //      'phoneNumber': phoneNumber!,
 //      'address': address!
 //    }).then((value) => debugPrint('success'));
 //  }
  Future login(String email,String password)async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    var test = await _auth.currentUser!.uid;
    debugPrint('user ${test}');
  }

  Future signOut()async{
   await _auth.signOut();

  }

  Future<userModel>getUserData()async{
    // await _auth.userChanges();
    // await _auth.currentUser!.reload();
    String? userID= await _auth.currentUser!.uid;
    debugPrint('${userID} currentUser');
    var userData = await FirebaseFirestore.instance.collection('users').doc(userID).get();
    debugPrint('${userID} get user ahu');
    userModel user=await userModel(userID,userData['email'],userData['userName'],userData['phoneNumber'],userData['address']);
    debugPrint('test ${user.userName}');
    return user;
  }

}