import 'dart:async';


import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/views/navpages/HomePage.dart';
import 'package:MCC/views/navpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
// bool isVerified =false;
const String verificationScreenRoute='/verificationScreenRoute';
Timer? timer;
class VerificationScreen extends StatefulWidget {
  // AuthCubit authCubit;
  String email;
  String userName;
  String phoneNumber;
  String address;
  VerificationScreen(this.email,this.userName,this.phoneNumber,this.address);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      AuthCubit authCubit = context.read<AuthCubit>();
    authCubit.timer =Timer.periodic(Duration(seconds: 6), (timer) => authCubit.checkEmailVerified(widget.email,widget.userName,widget.phoneNumber,widget.address));
  }
  @override

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {

      if (state is AuthCubitVerificationSuccess){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainpage(),));
      }
    },
    builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Padding(
          padding:  EdgeInsets.all(12.w),
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [Image.asset('img/emailVerification.jpg'),
            SizedBox(height: 15.h,),
            Text('check your inbox please for verification',style: GoogleFonts.aboreto(fontSize: 14.w,fontWeight: FontWeight.w800,color: Colors.teal))],
          )
          // Container(
          //   decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),
          //       color: Colors.white,
          //       boxShadow:[BoxShadow(color: Colors.black,spreadRadius: 5.w,blurRadius: 5.w,offset:Offset(2, 6) )]),
          //   child: Padding(
          //     padding: EdgeInsets.all(10.w),
          //     child: Text('check your inbox please for verification',style: GoogleFonts.aboreto(fontSize: 18.w),),
          //   ),),
        )),
      );
    },
    );
  }
}
