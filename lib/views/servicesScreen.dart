import 'package:MCC/cubits/order_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/views/serviceDetailsScreen.dart';
import 'package:MCC/widgets/customAppbar.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    // debugPrint('why ${BlocProvider.of<AuthCubit>(context).user!.phoneNumber}');

    ServicesCubit servicesCubit = context.read<ServicesCubit>();
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: customAppbar(
                title: S.of(context).service_request,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(10.h)),
                    child: Text(
                      (Localizations.localeOf(context).languageCode == 'ar')
                          ? widget.categoryy.AR['categoryName']
                          : widget.categoryy.EN['categoryName'],
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 25.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                                          debugPrint('clicked');
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
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              borderRadius:
                                                  BorderRadius.circular(10.h)),
                                          width: double.infinity,
                                          height: 70.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w),
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
                                                    fontSize: 20.w,
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
                                                  size: 40.r,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            )
                          : SpinKitCircle(
                              color: Theme.of(context).iconTheme.color,
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
