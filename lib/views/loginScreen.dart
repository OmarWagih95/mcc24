import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/spacing.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/styles/Styles.dart';
import 'package:MCC/views/navpages/HomePage.dart';

import 'package:MCC/views/navpages/main_page.dart';
import 'package:MCC/views/signeupScreen.dart';
import 'package:MCC/widgets/MyTextFormField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cash/shared_pref.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final emailcontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
        if (state is LoginSuccessState) {
          Fluttertoast.showToast(msg: 'you have been logged in successfully');
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => mainpage(
                  is_login: true,
                  navigationIndexfromRouting: 2,
                ),
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).Welcome_Back,
                      style: Textstyles.font24bluewbold),
                  verticalSpace(8),
                  Text(
                    S.of(context).We_are_excited_to_have_you_back,
                    style: Textstyles.font14grayregular,
                  ),
                  verticalSpace(32),
                  Form(
                      key: loginCubit.formKey,
                      child: Column(
                        children: [
                          MyTextFormfield(
                            hintText: S.of(context).email,
                            validation: (value) {
                              if (value!.isEmpty ||
                                  !loginCubit.regExp.hasMatch(value)) {
                                return 'please write your email in a good way';
                              } else {
                                loginCubit.email = value;
                              }
                            },
                            // controller: emailcontroller,
                          ),
                          verticalSpace(16),
                          MyTextFormfield(
                            hintText: S.of(context).password,
                            validation: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'password must be 8 char at least';
                              } else {
                                loginCubit.passWord = value;
                              }
                            },
                            isSecured: loginCubit.isSecured,
                            suffexicon: GestureDetector(
                              onTap: () {
                                loginCubit
                                    .changeIsSecured(!loginCubit.isSecured);
                              },
                              child: Icon(
                                  loginCubit.isSecured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 24),
                            ),
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
                          state is LoginLoadingState
                              ? SpinKitCircle(
                                  color: Colors.black54,
                                )
                              : TextButton(
                                  onPressed: () async {
                                    if (loginCubit.formKey.currentState!
                                        .validate()) {
                                      loginCubit.login();
                                      await CashHelper.setData(
                                        key: 'Islogin',
                                        value: true,
                                      );
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
                                              ColorsManager.mainColor)),
                                  child: Text(
                                    S.of(context).Login,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                          verticalSpace(50.h),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: S.of(context).Dont_have_an_account_yet,
                                  style: Textstyles.font13blackregular),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) => AuthCubit(),
                                          child: SigneUpScreen(),
                                        ),
                                      ));
                                    },
                                  text: S.of(context).Sign_Up,
                                  style: Textstyles.font13bluewbold),
                            ]),
                            textAlign: TextAlign.center,
                          )
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
