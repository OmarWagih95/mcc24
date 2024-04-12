import 'package:MCC/widgets/MyButtonW.dart';
import 'package:MCC/widgets/Mybutton.dart';
import 'package:MCC/widgets/OurPropertiesListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../model/service.dart';
import '../widgets/OrderingServiceDialog.dart';
class ServiceDetailsScreen extends StatelessWidget {
  Service service;
ServiceDetailsScreen(this.service);

//   Service service;
// ServiceDetailsScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.Color60Light,
        body: SingleChildScrollView(
          child: Stack(
            children: [Column(
              children: [Container(
                color: ColorsManager.Color60Light,
                height: 320.h,
                width: double.infinity,
                child: Image.network(service.logoImgURL,fit:BoxFit.fitHeight),
              )],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center,children: [SizedBox(height: 290.h,),Container(
              width: double.infinity,
            // height: 450.h,
            decoration: BoxDecoration(
                color: ColorsManager.Color60Light            ,borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))),
            child: Padding(
              padding:  EdgeInsets.all(15.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(service.AR['serviceName'],style: TextStyle(fontSize: 25.w,fontWeight: FontWeight.bold),),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end
                ,children: [Text(service.AR['serviceDesc'],style: TextStyle(fontSize:14.w,fontWeight:FontWeight.w600  ),)],),

              ),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Text(' :  ما نقدمه لكم ',style: TextStyle(fontSize: 20.w,fontWeight: FontWeight.w600),),
  ],
),
OurProvidingListItem(Icons.engineering, 'فنيون خبراء'),
OurProvidingListItem(Icons.shield_outlined, 'ضمان الخدمة'),
OurProvidingListItem(Icons.sentiment_very_satisfied, 'ضمان رضاء وسعادة عملائنا'),
OurProvidingListItem(Icons.money_off, 'افضل الأسعار'),
OurProvidingListItem(Icons.verified, 'ضمان إسترداد الأموال'),
              ],),
            ),),
            MyButton(text: 'طلب خدمة', onClick: (){
              showDialog(context: context, builder: (context) =>OrderingServiceDialog(service));
              print('clicked');
            }, textColor: Colors.white, buttonColor: ColorsManager.Color10Light)],)]
          ),
        ),
      ),
    );
  }
}
