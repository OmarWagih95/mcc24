import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    void getFinishedOrders() async {
      FinishedOrders = await BlocProvider.of<OrderCubit>(context)
          .GetMyFinishedOrders(
              BlocProvider.of<AuthCubit>(context).user!.userID!);
    }

    getFinishedOrders();
    BlocProvider.of<OrderCubit>(context)
        .GetMyOrders(BlocProvider.of<AuthCubit>(context).user!.userID!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'طلباتي',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: ColorsManager.mainColor.withOpacity(0.4),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: const [
                  TabItem(title: 'نشط'),
                  TabItem(title: 'منتهي'),
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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListView.builder(
          itemCount: FinishedOrders.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text(' adress is ${FinishedOrders[index]['address']}'),
                SizedBox(height: 20),
                Text(' des is ${FinishedOrders[index]['description']}'),
                SizedBox(height: 20),
                Text('userID is ${FinishedOrders[index]['userID']}'),
                SizedBox(height: 20),
                Text('serviceID is ${FinishedOrders[index]['serviceID']}'),
                SizedBox(height: 20),
                Text('active is ${FinishedOrders[index]['active']}'),
                SizedBox(height: 20),
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
        if (state is GettingMyOrdersSuccessState) {
          Fluttertoast.showToast(
              msg: 'aldata tmaam', backgroundColor: ColorsManager.mainColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: state is GettingMyOrdersLoadingState
                ? Container(
                    child: SpinKitCircle(
                      color: Colors.black45,
                    ),
                  )
                : Container(
                    child: ListView.builder(
                      itemCount: BlocProvider.of<OrderCubit>(context)
                              .ordersQueryDocsList!
                              .length -
                          1,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            child: Column(
                              children: [
                                Text(
                                    ' adress is ${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index]['address']}'),
                                SizedBox(height: 20),
                                Text(
                                    ' des is ${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index]['description']}'),
                                SizedBox(height: 20),
                                Text(
                                    'userID is ${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index]['userID']}'),
                                SizedBox(height: 20),
                                Text(
                                    'serviceID is ${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index]['serviceID']}'),
                                SizedBox(height: 20),
                                Text(
                                    'active is ${BlocProvider.of<OrderCubit>(context).ordersQueryDocsList![index]['active']}'),
                                SizedBox(height: 20),
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
          widget.count! > 0
              ? Container(
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.count! > 9 ? "9+" : widget.count.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
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
