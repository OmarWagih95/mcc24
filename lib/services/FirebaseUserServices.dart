import 'package:MCC/views/verificationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserServices{
  String? userID ;
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  Future signUp(String? email, String? password, String?userName , String? phoneNumber
      ,String? Address,)async{
    // try{
    await _auth.createUserWithEmailAndPassword(email: email!, password: password!).then((value){
      if (value != null) {
        print('$value hna flmodel');
        if(value.user! !=null){
          print('mwgoood ya 3m');
        }
        else{
          print('msh mwgoooud');
        }
        print(value.user!.uid);
         userID = value.user!.uid;
        // userController.userID=userID;


      }
    } );

    // }
    // catch(e){
    //   print(e);
    // }
    // print('done');
    return true;
  }
   Future<bool> checkAccountIsVerified()async{
     await FirebaseAuth.instance.currentUser!.reload();

     var user =await _auth.currentUser;
    print (user);
    var isVerified = user!.emailVerified;

    print(isVerified);
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
 Future userInfo (String email,String userName,String phoneNumber, String address )async{
    print('asht8lttttttt');
    print(email);print(userName);print(phoneNumber);print(address);
    print(userID);
    print('here');
    await usersCollection.doc('1').set({
      'email': email!,
      'userName': userName!,
      'phoneNumber': phoneNumber!,
      'address': address!
    }).then((value) => print('success'));
  }
  Future login(String email,String password)async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signOut()async{
    _auth.signOut();
  }

}