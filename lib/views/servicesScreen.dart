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
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../cubits/login_cubit.dart';
import '../widgets/leftappbarUpdate.dart';

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
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: LeftAppBarUpdate(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                children: [
                  Text(
                    (Localizations.localeOf(context).languageCode == 'ar')
                        ? widget.categoryy.AR['categoryName']
                        : widget.categoryy.EN['categoryName'],
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 25.w,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
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
                              height: 500.h,
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
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              // boxShadow: [
                                              //   // BoxShadow(
                                              //   //   color: Colors.grey.shade400,
                                              //   //   spreadRadius: 1,
                                              //   //   blurRadius: 15,
                                              //   //   blurStyle: BlurStyle.outer,
                                              //   //   // offset:Offset(0, -5)
                                              //   // )
                                              // ]
                                              // color: ColorsManager.,
                                              // gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomLeft,colors: [Colors.black12,Colors.purple.shade200]),
                                              // ,
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
                                                  (Localizations.localeOf(
                                                                  context)
                                                              .languageCode ==
                                                          'ar')
                                                      ? context
                                                          .read<ServicesCubit>()
                                                          .servicesDataList[
                                                              index]
                                                          .AR['serviceName']
                                                      : context
                                                          .read<ServicesCubit>()
                                                          .servicesDataList[
                                                              index]
                                                          .EN['serviceName'],
                                                  style: TextStyle(
                                                    fontSize: 25.w,
                                                  ),
                                                ),
                                                Icon(
                                                  (Localizations.localeOf(
                                                                  context)
                                                              .languageCode ==
                                                          'en')
                                                      ? Icons.arrow_circle_left
                                                      : Icons
                                                          .arrow_circle_right,
                                                  color: Theme.of(context)
                                                      .hoverColor,
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
