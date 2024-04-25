import 'dart:developer';

import 'package:MCC/model/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../model/service.dart';
import './../model/order.dart';
class OrderServices {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');
  final CollectionReference servicesCollection =FirebaseFirestore.instance.collection('services');

  addOrder(String userID, String serviceID, String description,
      String phoneNumber, String address) async {
    await ordersCollection.add({
      'userID': userID,
      'serviceID': serviceID,
      'description': description,
      'phoneNumber': phoneNumber,
      'address': address,
      'active': true
    });
  }

  Future<List> getActiveOrdersByID(String userID) async {
    List<QueryDocumentSnapshot> OrdersQueryDocsList = [];
    List ordersData=[];
    Service service;
    QuerySnapshot querySnapshot = await ordersCollection
        .where('userID', isEqualTo: userID)
        .where('active', isEqualTo: true)
        .get();

    OrdersQueryDocsList.addAll(querySnapshot.docs);
    for(int i =0; i<OrdersQueryDocsList.length ; i++){
      service =await getServiceDataByID(OrdersQueryDocsList[i]['serviceID']);
      print(service.AR['serviceName']);
      OrderDetails order=OrderDetails(OrdersQueryDocsList[i]['active'], OrdersQueryDocsList[i]['address'], OrdersQueryDocsList[i]['description'], OrdersQueryDocsList[i]['phoneNumber'], OrdersQueryDocsList[i]['userID'], OrdersQueryDocsList[i]['serviceID'],service);
      ordersData.add(order);
      print(ordersData.length);
      try{

      print(ordersData[i]);
      print(ordersData[i].active);
      }
      catch(e){
        print(e);
      }
    }
    //  OrdersQueryDocsList.forEach((element) async{
    //   service =await getServiceDataByID(element['serviceID']);
    //   print(service.AR['serviceName']);
    //   ordersData.add({element,service});
    //   print(ordersData.length);
    // });
      print('${ordersData.length} abl alreturn');
    return ordersData;
  }

  Future<List> getFinishedOrdersByID(
      String userID) async {
    List<QueryDocumentSnapshot> OrdersQueryDocsList = [];
    List ordersData=[];
    Service service;
    QuerySnapshot querySnapshot = await ordersCollection
        .where('userID', isEqualTo: userID)
        .where('active', isEqualTo: false)
        .get();
    OrdersQueryDocsList.addAll(querySnapshot.docs);
    OrdersQueryDocsList.forEach((element) async{
      service =await getServiceDataByID(element['serviceID']);
      ordersData.add({element,service});
    });
    return ordersData;
  }
  Future <Service> getServiceDataByID(String id)async{
    var serviceee;
    serviceee =await servicesCollection.doc(id).get();
    Service service= Service(id,serviceee['EN'],serviceee['AR'],serviceee['image']);
    return service;
  }
}
