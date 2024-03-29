import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/spacing.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/styles/Styles.dart';
import 'package:MCC/views/signeupScreen.dart';
import 'package:MCC/widgets/MyTextFormField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSecured = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
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
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextFormfield(
                        hintText: S.of(context).email,
                        controller: emailcontroller,
                      ),
                      verticalSpace(16),
                      MyTextFormfield(
                        hintText: S.of(context).password,
                        isSecured: isSecured,
                        controller: passwordcontroller,
                        suffexicon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          child: Icon(
                              isSecured
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
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            backgroundColor: MaterialStateProperty.all(
                                ColorsManager.mainColor)),
                        child: Text(
                          S.of(context).Login,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      verticalSpace(50),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: S.of(context).Dont_have_an_account_yet,
                              style: Textstyles.font13blackregular),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) => BlocProvider(create: (context) =>AuthCubit(),
                                      child: SigneUpScreen(),),));
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
  }
}
