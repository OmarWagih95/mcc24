import 'dart:async';
import 'dart:developer';

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/constants.dart';
import 'package:MCC/helpers/spacing.dart';
import 'package:MCC/views/navpages/main_page.dart';
import 'package:MCC/views/signeupScreen.dart';
import 'package:MCC/widgets/MyTextFormField.dart';
import 'package:MCC/widgets/customAppbar.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

GlobalKey<NavigatorState> LoginScreenNavigatorKey = GlobalKey<NavigatorState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
        if (state is LoginSuccessState) {
          Fluttertoast.showToast(
              msg: S.of(context).you_have_been_logged_in_successfully);
// لسا هغير اللغة
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: customAppbar(
                  arrow: false,
                  title: S.of(context).My_Order,
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
                        style: Theme.of(context).textTheme.displayLarge!),
                    verticalSpace(8),
                    Text(
                      S.of(context).We_are_excited_to_have_you_back,
                      style: Theme.of(context).textTheme.bodyMedium,
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
                                  return S
                                      .of(context)
                                      .please_write_your_email_in_a_good_way;
                                  //لسا هغير اللغة هنا
                                } else {
                                  loginCubit.email = value;
                                }
                              },
                            ),
                            verticalSpace(16),
                            MyTextFormfield(
                              hintText: S.of(context).password,
                              validation: (value) {
                                if (value!.isEmpty || value.length < 8) {
                                  return S
                                      .of(context)
                                      .password_must_be_8_char_at_least;
                                  //لسا هغير اللغة هنا
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
                            // محتاج اعمل اعادة الباسورد في الفايربيز
                            // Row(children: [
                            //   Text(S.of(context).Remember_me,
                            //       style:
                            //           Theme.of(context).textTheme.bodyMedium),
                            //   horizontallSpace(70),
                            //   Text(S.of(context).Forgot_Password,
                            //       style:
                            //           Theme.of(context).textTheme.bodyMedium),
                            // ]),
                            verticalSpace(20),
                            state is LoginLoadingState
                                ? const SpinKitCircle(
                                    color: FxColors.primary,
                                  )
                                : (state is LoginSuccessState &&
                                        BlocProvider.of<AuthCubit>(context)
                                                .user ==
                                            null)
                                    ? const SpinKitCircle(
                                        color: FxColors.primary,
                                      )
                                    : TextButton(
                                        onPressed: () async {
                                          if (loginCubit.formKey.currentState!
                                              .validate()) {
                                            await loginCubit.login();

                                            await CashHelper.setData(
                                              key: 'Islogin',
                                              value: true,
                                            );
                                            Currindx = 0;
                                            // changeremoteindex();
                                            Timer(const Duration(seconds: 2),
                                                () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => mainpage(
                                                      is_login: true,
                                                      // navigationIndexfromRouting: 2,
                                                      ),
                                                ),
                                              );
                                            });
                                            log('نفذ تغيير الاندكس');
                                          }
                                        },
                                        style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(
                                                        double.infinity, 50)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    FxColors.primary)),
                                        child: Text(S.of(context).Login,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(color: Colors.black)),
                                      ),
                            verticalSpace(50.h),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        S.of(context).Dont_have_an_account_yet,
                                    style:
                                        Theme.of(context).textTheme.bodySmall!),
                                const TextSpan(
                                  text: '   ',
                                ),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color:
                                                Theme.of(context).shadowColor)),
                              ]),
                              textAlign: TextAlign.center,
                            )
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
