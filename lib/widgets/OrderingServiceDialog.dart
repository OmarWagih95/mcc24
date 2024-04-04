import 'package:MCC/widgets/MyButtonW.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../model/service.dart';
class OrderingServiceDialog extends StatelessWidget {
Service service;
OrderingServiceDialog(this.service);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,

insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      child:Container(
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
            child: Form(child: Column(
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
                    minLines: 4
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
            )),
          )
          ,MyButton(text: 'تأكيد', onClick: (){}, textColor: Colors.white, buttonColor: Colors.teal)],
          ),
        ),
      ),
    );
  }
}
