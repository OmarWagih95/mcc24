import 'package:MCC/model/Network_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Externaldata {
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  Reference get firebaseStorage => FirebaseStorage.instance.ref();
  List<CategoryyModel> categoryDataList = [];

  Future<List<CategoryyModel>> getCategoriesData() async {
    try {
      List<QueryDocumentSnapshot> categoryDataQueryList = [];
      categoryDataList.clear();
      QuerySnapshot querySnapshot = await _categories.get();
      categoryDataQueryList.addAll(querySnapshot.docs);

      for (int i = 0; i < categoryDataQueryList.length; i++) {
        String? x = await getCategorisImg(categoryDataQueryList[i]['logoIMG']);
        categoryDataList
            .add(CategoryyModel.fromFirebase(categoryDataQueryList[i], x!));
      }
      return categoryDataList!;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String?> getCategorisImg(String img) async {
    try {
      var urlRef = firebaseStorage.child('images').child(img);
      var imgUrl = await urlRef.getDownloadURL();
      print(imgUrl);
      return imgUrl;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
