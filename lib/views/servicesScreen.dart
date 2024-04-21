import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/order_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/model/service.dart';
import 'package:MCC/views/Service_detail_screen.dart';
import 'package:MCC/views/serviceDetailsScreen.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../cubits/login_cubit.dart';

class ServicesScreen extends StatefulWidget {
  Categoryy categoryy;
  ServicesScreen(this.categoryy);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // getServicesData_()async{
    //   context.read<ServicesCubit>().getServicesData(widget.categoryy.id);
    // }
    // getServicesData_();
  }
  @override
  Widget build(BuildContext context) {
    // print('why ${BlocProvider.of<AuthCubit>(context).user!.phoneNumber}');

    ServicesCubit servicesCubit = context.read<ServicesCubit>();
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                )
              ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leftappbar(),
                    Text(
                      'MCC',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (Localizations.localeOf(context).languageCode == 'ar')
                            ? widget.categoryy.AR['categoryName']
                            : widget.categoryy.EN['categoryName'],
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 25.w,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  BlocConsumer<ServicesCubit, ServicesState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state is ServicesPageSuccess
                          ? Container(
                              height: 600.h,
                              child: ListView.builder(
                                  itemCount:
                                      servicesCubit.servicesDataList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          print('clicked');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlocProvider(
                                                        create: (context) =>
                                                            OrderCubit(),
                                                        child: ServiceDetailsScreen(
                                                            state.servicesDataList[
                                                                index]
                                                            //     Service(context.read<ServicesCubit>().servicesDataList[index].id,
                                                            //   context.read<ServicesCubit>().servicesDataList[index].AR,
                                                            //   context.read<ServicesCubit>().servicesDataList[index].EN,
                                                            //   context.read<ServicesCubit>().servicesDataList[index].logoImgURL,
                                                            // )
                                                            ),
                                                      )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade600,
                                                  spreadRadius: 1,
                                                  blurRadius: 15,
                                                  blurStyle: BlurStyle.outer,
                                                  // offset:Offset(0, -5)
                                                )
                                              ]
                                              // color: ColorsManager.,
                                              // gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomLeft,colors: [Colors.black12,Colors.purple.shade200]),
                                              ,
                                              borderRadius:
                                                  BorderRadius.circular(10.h)),
                                          width: double.infinity,
                                          height: 70.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  context
                                                      .read<ServicesCubit>()
                                                      .servicesDataList[index]
                                                      .AR['serviceName'],
                                                  style: TextStyle(
                                                    fontSize: 25.w,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_circle_left,
                                                  color: Theme.of(context)
                                                      .shadowColor,
                                                  size: 40.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            )
                          : SpinKitCircle(
                              color: Colors.black45,
                            );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
