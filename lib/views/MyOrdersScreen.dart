import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if(state is GettingMyOrdersFailureState){
          Fluttertoast.showToast(msg: 'there was an error while retreiving data',backgroundColor: ColorsManager.mainColor);
        };
        if(state is GettingMyOrdersSuccessState){
          Fluttertoast.showToast(msg: 'aldata tmaam',backgroundColor: ColorsManager.mainColor);
        };
      },
      builder: (context, state) {
        return Scaffold(
          body:state is GettingMyOrdersLoadingState? Center(child:
            SpinKitCircle(color: Colors.black45,),) :Container()
        );
      },
    );
  }
}
