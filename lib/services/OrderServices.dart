import 'package:cloud_firestore/cloud_firestore.dart';

class OrderServices {
  final CollectionReference ordersCollection = FirebaseFirestore.instance.collection('orders');
  addOrder(String userID,String serviceID,String description,String phoneNumber,String address)async{
    await ordersCollection.add({'userID':userID,
    'serviceID':serviceID,
    'description':description,
    'phoneNumber':phoneNumber,
    'address':address,
      'active':true
    });
  }
 Future <List<QueryDocumentSnapshot>> getOrdersByID(String userID)async{
    List<QueryDocumentSnapshot> OrdersQueryDocsList = [];
    QuerySnapshot querySnapshot=await ordersCollection.where('userID',isEqualTo: userID).get();
    OrdersQueryDocsList.addAll(querySnapshot.docs);
    return OrdersQueryDocsList;
  }


}