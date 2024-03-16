import 'package:androidstudiommc/constants/colors.dart';
import 'package:androidstudiommc/generated/l10n.dart';
import 'package:androidstudiommc/helpers/spacing.dart';
import 'package:androidstudiommc/routing/routes.dart';
import 'package:androidstudiommc/styles/Styles.dart';
import 'package:androidstudiommc/widgets/textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                              text: 'By logging, you agree to our   ',
                              style: Textstyles.font13grayregular),
                          TextSpan(
                              text: 'Terms & Conditions',
                              style: Textstyles.font13blackregular),
                          TextSpan(
                              text: '  and  ',
                              style: Textstyles.font13grayregular
                                  .copyWith(height: 1.5)),
                          TextSpan(
                              text: 'PrivacyPolicy.',
                              style: Textstyles.font13blackregular),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(30),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Already have an account yet?',
                              style: Textstyles.font13blackregular),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.signeupScreen);
                                },
                              text: '  Sign Up ',
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
