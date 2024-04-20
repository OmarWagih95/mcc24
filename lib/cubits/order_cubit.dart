import 'dart:developer';

import 'package:MCC/services/OrderServices.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  // String? userID;
  String description = '';
  String phoneNumber = '';
  String address = '';
  bool active = true;
  List? ordersQueryDocsList;
  GlobalKey<FormState> orderFormKey = GlobalKey();

  OrderCubit() : super(OrderInitial());
  addOrder(String userID, String serviceID) async {
    emit(AddingOrderLoadingState());
    try {
      await OrderServices()
          .addOrder(userID, serviceID, description, phoneNumber, address);
      emit(AddingOrderSuccessState());
    } catch (e) {
      emit(AddingOrderFailureState());
    }
  }

  GetMyOrders(String userID) async {
    emit(GettingMyOrdersLoadingState());
    try {
      ordersQueryDocsList = await OrderServices().getOrdersByID(userID);
      emit(GettingMyOrdersSuccessState());
    } catch (e) {
      emit(GettingMyOrdersFailureState());
    }
  }

  Future<List<dynamic>> GetMyFinishedOrders(String userID) async {
    var FinishedOrders = [];
    try {
      return FinishedOrders =
          await OrderServices().getFinishedOrdersByID(userID);
    } catch (e) {
      log(e.toString());
      return FinishedOrders;
    }
  }
}
