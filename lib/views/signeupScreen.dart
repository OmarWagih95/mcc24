import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/spacing.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/styles/Styles.dart';
import 'package:MCC/views/verificationScreen.dart';
import 'package:MCC/widgets/MyTextFormField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cubits/auth_cubit.dart';

class SigneUpScreen extends StatefulWidget {
  SigneUpScreen({super.key});

  @override
  State<SigneUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SigneUpScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCubitFailure) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
        if (state is AuthCubitVerificationLoading) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: VerificationScreen(state.email, state.userName,
                      state.phoneNumber, state.Address),
                ),
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).Welcome_Back,
                      style: Theme.of(context).textTheme.displayLarge),
                  verticalSpace(8),
                  Text(S.of(context).We_are_excited_to_have_you_back,
                      style: Theme.of(context).textTheme.titleSmall),
                  verticalSpace(32),
                  Form(
                      key: authCubit.formKey,
                      child: Column(
                        children: [
                          MyTextFormfield(
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'please write your username';
                              } else {
                                authCubit.userName = value;
                              }
                            },
                            hintText: S.of(context).username,
                          ),
                          verticalSpace(16),
                          MyTextFormfield(
                            validation: (value) {
                              if (value!.isEmpty ||
                                  !authCubit.regExp.hasMatch(value)) {
                                return 'please write your email in a good way';
                              } else {
                                authCubit.email = value;
                              }
                            },
                            hintText: S.of(context).email,
                            controller: emailcontroller,
                          ),
                          verticalSpace(16),
                          MyTextFormfield(
                            validation: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'password must be 8 char at least';
                              } else {
                                authCubit.passWord = value;
                              }
                            },
                            hintText: S.of(context).password,
                            isSecured: authCubit.isSecured,
                            controller: passwordcontroller,
                            suffexicon: GestureDetector(
                              onTap: () {
                                authCubit.changeIsSecured(!authCubit.isSecured);
                              },
                              child: Icon(
                                  authCubit.isSecured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 24),
                            ),
                          ),
                          verticalSpace(16),
                          MyTextFormfield(
                            validation: (value) {
                              if (value!.isEmpty || value.length < 11) {
                                return 'phone number must be 11 char';
                              } else {
                                authCubit.phoneNumber = value;
                              }
                            },
                            hintText: S.of(context).Phone_number,
                          ),
                          verticalSpace(16),
                          MyTextFormfield(
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'please write your address';
                              } else {
                                authCubit.address = value;
                              }
                            },
                            hintText: S.of(context).Adress,
                          ),
                          verticalSpace(16),
                          Row(children: [
                            Text(S.of(context).Remember_me,
                                style: Textstyles.font14darkgraymedium),
                            horizontallSpace(70),
                            Text(S.of(context).Forgot_Password,
                                style: Textstyles.font14blueregular),
                          ]),
                          verticalSpace(20),
                          state is AuthCubitLoading
                              ? SpinKitCircle(color: Colors.black45)
                              : TextButton(
                                  onPressed: () {
                                    if (authCubit.formKey.currentState!
                                        .validate()) {
                                      authCubit.signUp();
                                    }
                                  },
                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(double.infinity, 50)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),
                                  child: Text(
                                    S.of(context).Sign_Up,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                          verticalSpace(50),
                        ],
                      ))
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
