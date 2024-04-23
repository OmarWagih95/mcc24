import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/order_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/MyButtonW.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';
import '../model/service.dart';

class OrderingServiceDialog extends StatelessWidget {
  Service service;
  OrderingServiceDialog(this.service);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is AddingOrderSuccessState) {
          Fluttertoast.showToast(msg: S.of(context).service_request_success);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
        return Dialog(
          // backgroundColor: Colors.white,
          // surfaceTintColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
          child: state is AddingOrderLoadingState
              ? Container(
                  width: 600.w,
                  height: 600.h,
                  child: Center(
                    child: SpinKitCircle(
                      color: Colors.black45,
                    ),
                  ),
                )
              : Container(
                  width: 600.w,
                  height: 600.h,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).service_confirmation,
                          style: TextStyle(
                              fontSize: 20.w,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        Expanded(
                          child: Form(
                              key: orderCubit.orderFormKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: Column(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.end,
                                        children: [
                                          Card(
                                            color:
                                                Theme.of(context).primaryColor,
                                            elevation: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 5),
                                              child: Text(
                                                (Localizations.localeOf(context)
                                                            .languageCode ==
                                                        'ar')
                                                    ? service.AR['serviceName']
                                                    : service.EN['serviceName'],
                                                style: TextStyle(
                                                    fontSize: 16.w,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${S.of(context).Please_write_the_description} :',
                                            style: TextStyle(
                                                fontSize: 16.w,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return S
                                                .of(context)
                                                .Please_write_the_description;
                                          } else {
                                            orderCubit.description = value;
                                          }
                                        },
                                        minLines: 4,
                                        maxLines: 6,
                                        decoration: InputDecoration(
                                            fillColor:
                                                ColorsManager.lighterGray,
                                            filled: true,
                                            hintText: S
                                                .of(context)
                                                .detailed_description_prompt,
                                            // hintTextDirection: TextDirection.rtl,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 20.h,
                                                    vertical: 18.h),
                                            enabledBorder: Theme.of(context)
                                                .inputDecorationTheme
                                                .enabledBorder,
                                            focusedBorder: Theme.of(context)
                                                .inputDecorationTheme
                                                .focusedBorder,),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(S.of(context).Adress),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        initialValue:
                                            BlocProvider.of<AuthCubit>(context)
                                                .user!
                                                .address!,
                                        validator: (value) {
                                          if (value!.isNotEmpty) {
                                            orderCubit.address = value;
                                          } else if (value.isEmpty) {
                                            orderCubit.address =
                                                BlocProvider.of<AuthCubit>(
                                                        context)
                                                    .user!
                                                    .address!;
                                          }
                                        },
                                        // minLines: 3,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          fillColor: ColorsManager.lighterGray,
                                          filled: true,
                                          // hintText: BlocProvider.of<AuthCubit>(
                                          //         context)
                                          //     .user!
                                          //     .phoneNumber!,
                                          // hintText:S.of(context).contact_number_prompt,
                                          // hintTextDirection: TextDirection.rtl,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20.h, vertical: 18.h),
                                          enabledBorder: Theme.of(context)
                                                .inputDecorationTheme
                                                .enabledBorder,
                                            focusedBorder: Theme.of(context)
                                                .inputDecorationTheme
                                                .focusedBorder,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15.h),
                                    Row(
                                      children: [
                                        Text(S.of(context).Contact_Number),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        initialValue:
                                            BlocProvider.of<AuthCubit>(context)
                                                .user!
                                                .phoneNumber!,
                                        validator: (value) {
                                          if (value!.isNotEmpty) {
                                            orderCubit.phoneNumber = value;
                                          } else if (value.isEmpty) {
                                            orderCubit.address =
                                                BlocProvider.of<AuthCubit>(
                                                        context)
                                                    .user!
                                                    .phoneNumber!;
                                          }
                                        },
                                        minLines: 1,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          fillColor: ColorsManager.lighterGray,
                                          filled: true,
                                          // hintText: BlocProvider.of<AuthCubit>(
                                          //         context)
                                          //     .user!
                                          //     .address!,
                                          // hintText: S.of(context).address_description_prompt,
                                          // hintTextDirection: TextDirection.rtl,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20.h, vertical: 18.h),
                                        enabledBorder: Theme.of(context)
                                                .inputDecorationTheme
                                                .enabledBorder,
                                            focusedBorder: Theme.of(context)
                                                .inputDecorationTheme
                                                .focusedBorder,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        MyButton(
                            text: S.of(context).confirmation,
                            onClick: () {
                              if (orderCubit.orderFormKey.currentState!
                                  .validate()) {
                                orderCubit.addOrder(
                                    BlocProvider.of<AuthCubit>(context)
                                        .user!
                                        .userID!,
                                    service.id);
                                print('tmaaaaam');
                              }
                            },
                            textColor: Theme.of(context).hintColor,
                            buttonColor: Theme.of(context).primaryColor)
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
