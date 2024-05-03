import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../service.dart';

class ServicesNetwork {
  final CollectionReference _services =
      FirebaseFirestore.instance.collection('services');
  Reference get firebaseStorage => FirebaseStorage.instance.ref();
  Future<List<Service>> getServicesData(
      String categoryID, List<Service> servicesDataList) async {
    List<QueryDocumentSnapshot> servicesDataQueryList = [];
    servicesDataList.clear();
    QuerySnapshot querySnapshot =
        await _services.where('categoryID', isEqualTo: categoryID).get();
    servicesDataQueryList.addAll(querySnapshot.docs);
    for (int i = 0; i < servicesDataQueryList.length; i++) {
      var URL = servicesDataQueryList[i]['image'];
      debugPrint('$URL');
      servicesDataList.add(Service(
          servicesDataQueryList[i].id,
          servicesDataQueryList[i]['EN'],
          servicesDataQueryList[i]['AR'],
          URL!));
    }
    debugPrint('hna flcubit');
    debugPrint('${servicesDataList.length} here');
    return servicesDataList;
  }

  Future<String?> getServicesImg(String img) async {
    try {
      var urlRef = await firebaseStorage
          .child('images')
          .child('servicesImages')
          .child(img);
      var imgUrl = await urlRef.getDownloadURL();
      debugPrint(imgUrl);
      return imgUrl;
    } catch (e) {
      debugPrint('$e');
    }
  }
}
