import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/order_cubit.dart';
import 'package:MCC/widgets/MyButtonW.dart';
import 'package:flutter/material.dart';
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
if(state is OrderSuccess){
  Fluttertoast.showToast(msg: 'تم طلب الخدمة بنجاح');
  Navigator.pop(context);
}

  },
  builder: (context, state) {
    OrderCubit orderCubit =BlocProvider.of<OrderCubit>(context);
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,

insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      child: state is OrderLoading ?
        Container(
      width: 600.w,
      height: 600.h
            ,child: Center(child: SpinKitCircle(color: Colors.black45, ))) :Container(
        width: 600.w,
        height: 600.h,
        decoration: BoxDecoration(

        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center
            ,children: [Text('تأكيد طلب الخدمة',style: TextStyle(fontSize: 20.w,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
          Expanded(
            child: Form(
            key: orderCubit.orderFormKey
            ,child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Text(service.AR['serviceName'],style: TextStyle(fontSize: 16.w,fontWeight: FontWeight.bold),)
                  ,Text(' :الخدمة',style: TextStyle(fontSize: 16.w,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(

                    width: double.infinity,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'من فضلك اكتب الوصف';
                        }
                        else{
                          orderCubit.description=value;
                        }
                      }
                      ,minLines: 4
                      ,maxLines: 6
                      ,decoration: InputDecoration(
                      fillColor: ColorsManager.lighterGray,
                        filled: true,

                      hintText: 'من فضلك أكتب شرحا مفصلا',
                        hintTextDirection: TextDirection.rtl,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: ColorsManager.lightGray, width: 1.3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: ColorsManager.mainBlue, width: 1.3))),


                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Container(

                    width: double.infinity,
                    child: TextFormField(
                      validator: (value){
                        if (value!.isNotEmpty){
                          orderCubit.phoneNumber=value;
                        }
                      },
                      // minLines: 4
                      // ,maxLines:
                      decoration: InputDecoration(
                      fillColor: ColorsManager.lighterGray,
                        filled: true,

                      hintText: 'أضف رقما للتواصل (إختياري)',
                        hintTextDirection: TextDirection.rtl,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: ColorsManager.lightGray, width: 1.3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: ColorsManager.mainBlue, width: 1.3))),


                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(

                    width: double.infinity,
                    child: TextFormField(
                      validator: (value){
                        if (value!.isNotEmpty){
                          orderCubit.address=value;
                        }
                      },
                      minLines: 3
                      ,maxLines:5,
                      decoration: InputDecoration(
                      fillColor: ColorsManager.lighterGray,
                        filled: true,

                      hintText: 'شرح تفصيلي للعنوان (إختياري)',
                        hintTextDirection: TextDirection.rtl,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: ColorsManager.lightGray, width: 1.3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: ColorsManager.mainBlue, width: 1.3))),


                    ),
                  ),

                ],
              ),
            )),
          )
          ,MyButton(text: 'تأكيد', onClick: (){

    if(orderCubit.orderFormKey.currentState!.validate()){
    orderCubit.addOrder(BlocProvider.of<AuthCubit>(context).user!.userID!,service.id);
      print('tmaaaaam');
    }

            }, textColor: Colors.white, buttonColor: Colors.teal)],
          ),
        ),
      ),
    );
  },
);
  }
}
