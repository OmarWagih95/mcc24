import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/spacing.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/styles/Styles.dart';
import 'package:MCC/views/verificationScreen.dart';
import 'package:MCC/widgets/MyTextFormField.dart';
import 'package:MCC/widgets/customAppbar.dart';
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
              child: Column(
            children: [
              SafeArea(
                child: customAppbar(
                  arrow: true,
                  title: S.of(context).Sign_Up,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
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
                                  return S
                                      .of(context)
                                      .please_write_your_username;
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
                                  return S
                                      .of(context)
                                      .please_write_your_email_in_a_good_way;
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
                                  return S
                                      .of(context)
                                      .password_must_be_8_char_at_least;
                                } else {
                                  authCubit.passWord = value;
                                }
                              },
                              hintText: S.of(context).password,
                              isSecured: authCubit.isSecured,
                              controller: passwordcontroller,
                              suffexicon: GestureDetector(
                                onTap: () {
                                  authCubit
                                      .changeIsSecured(!authCubit.isSecured);
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
                              keyboardType: TextInputType.phone,
                              validation: (value) {
                                if (double.tryParse(value!) == null) {
                                  return 'Please enter a valid number';
                                }
                                if (value!.isEmpty || value.length < 11) {
                                  return S
                                      .of(context)
                                      .phone_number_must_be_11_char;
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
                                  return S
                                      .of(context)
                                      .please_write_your_address;
                                } else {
                                  authCubit.address = value;
                                }
                              },
                              hintText: S.of(context).Adress,
                            ),
                            verticalSpace(16),
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
                                                FxColors.primary)),
                                    child: Text(
                                      S.of(context).Sign_Up,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                            verticalSpace(50),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
