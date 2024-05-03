import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../category.dart';

class CategoriesNetwork {
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');

  Reference get firebaseStorage => FirebaseStorage.instance.ref();

  Future<List<Categoryy>> getCategoriesData(categoryDataList) async {
    List<QueryDocumentSnapshot> categoryDataQueryList = [];
    categoryDataList.clear();
    QuerySnapshot querySnapshot = await _categories.get();
    categoryDataQueryList.addAll(querySnapshot.docs);
    debugPrint('$categoryDataQueryList.length');
    for (int i = 0; i < categoryDataQueryList.length; i++) {
      var URL = await getCategorisImg(categoryDataQueryList[i]['logoIMG']);
      debugPrint(URL);
      categoryDataList.add(Categoryy(
          id: categoryDataQueryList[i].id,
          AR: categoryDataQueryList[i]['AR'],
          EN: categoryDataQueryList[i]['EN'],
          logoImgURL: URL));
    }
    debugPrint('hna flcubit');
    return categoryDataList;
  }

  Future<String?> getCategorisImg(String img) async {
    try {
      var urlRef = await firebaseStorage.child('images').child(img);
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      debugPrint('$e');
    }

    // if (urlRef != null){
    //
    // return storageImg;
    // }
  }
}
