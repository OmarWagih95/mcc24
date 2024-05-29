import 'dart:developer';

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/home_page_cubit.dart';
import 'package:MCC/cubits/order_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/userModel.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

List FinishedOrders = [];

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

GlobalKey<NavigatorState> MypageNavigatorKey = GlobalKey<NavigatorState>();

class _MypageState extends State<Mypage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).getUserData();
    /////////////////////////
    BlocProvider.of<OrderCubit>(context)
        .GetMyActiveOrders(BlocProvider.of<AuthCubit>(context).user!.userID!);
    /////////////////////
    void getFinishedOrders() async {
      FinishedOrders = await BlocProvider.of<OrderCubit>(context)
          .GetMyFinishedOrders(
              BlocProvider.of<AuthCubit>(context).user!.userID!);
    }

    getFinishedOrders();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.all(8.r),
            child: Text(
              S.of(context).My_Order,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.r),
            child: Container(
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                labelColor: Theme.of(context).iconTheme.color,
                unselectedLabelColor:
                    Theme.of(context).iconTheme.color!.withOpacity(.1),
                tabs: [
                  TabItem(title: S.of(context).Active),
                  TabItem(title: S.of(context).Finished),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            activeOrders(),
            finishedOreders(),
          ],
        ),
      ),
    );
  }
}

class finishedOreders extends StatelessWidget {
  const finishedOreders({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      child: Card(
        child: ListView.builder(
          itemCount: FinishedOrders.length,
          itemBuilder: (BuildContext context, int index) {
            String serviceName =
                (Localizations.localeOf(context).languageCode == 'ar')
                    ? FinishedOrders[index].service.AR['serviceName']
                    : FinishedOrders[index].service.EN['serviceName'];
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.w),
                    Text(S.of(context).address),
                    const Spacer(),
                    Expanded(
                      child: Text(
                        '${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index].address}',
                        maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.w),
                    Text(S.of(context).description),
                    Spacer(),
                    Expanded(
                      child: Text(
                        '${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index].description}',
                        maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.w),
                    Text(S.of(context).ServiceName),
                    Spacer(),
                    Expanded(
                      child: Text(
                        FinishedOrders[index].service.AR['serviceName'],
                        maxLines: 4,
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class activeOrders extends StatelessWidget {
  const activeOrders({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is GettingMyOrdersFailureState) {
          Fluttertoast.showToast(
              msg: 'there was an error while retreiving data',
              backgroundColor: ColorsManager.mainColor);
        }
        // if (state is GettingMyOrdersSuccessState) {
        //   Fluttertoast.showToast(
        //       msg: '', backgroundColor: ColorsManager.mainColor);
        // }
      },
      builder: (context, state) {
        return Scaffold(
            body: state is GettingMyOrdersLoadingState
                ? Container(
                    child: SpinKitCircle(
                      color: Theme.of(context).shadowColor,
                    ),
                  )
                : Container(
                    child: ListView.builder(
                      itemCount: BlocProvider.of<OrderCubit>(context)
                              .ordersQueryDocsList!
                              .length -
                          1,
                      itemBuilder: (BuildContext context, int index) {
                        String serviceName =
                            (Localizations.localeOf(context).languageCode ==
                                    'ar')
                                ? BlocProvider.of<OrderCubit>(context)
                                    .ordersQueryDocsList[index]
                                    .service
                                    .AR['serviceName']
                                : BlocProvider.of<OrderCubit>(context)
                                    .ordersQueryDocsList[index]
                                    .service
                                    .EN['serviceName'];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5.w),
                                    Text(S.of(context).address),
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                          '${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index].address}',
                                          maxLines: 2),
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5.w),
                                    Text(S.of(context).description),
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                        '${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index].description}',
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5.w),
                                    Text(S.of(context).ServiceName),
                                    Spacer(),
                                    Expanded(
                                        child: Text(
                                            BlocProvider.of<OrderCubit>(context)
                                                .ordersQueryDocsList![index]
                                                .service
                                                .AR['serviceName'],
                                            maxLines: 2)),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ));
      },
    );
  }
}

class TabItem extends StatefulWidget {
  final String title;
  final bool? isFinished;
  final int count;

  const TabItem({
    super.key,
    required this.title,
    this.count = 0,
    this.isFinished,
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
          ),
          widget.count > 0
              ? Container(
                  margin: EdgeInsetsDirectional.only(start: 5.w),
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.count! > 9 ? "9+" : widget.count.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
