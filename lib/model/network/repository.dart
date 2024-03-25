import 'dart:developer';

import 'package:MCC/model/Network_data_model.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/model/network/categoriesNetwork.dart';

class CategorisRepository {
  final CategoriesNetwork categoriesNetwork;
  CategorisRepository({required this.categoriesNetwork});
  List<CategoryyModel> cubitdata = [];

  Future<List<Categoryy>> getCategoriesData() async {
    var categoriesNetworkData = await categoriesNetwork.getCategoriesData();
    List<Categoryy> categorydata = [];

    for (int i = 0; i < categoriesNetworkData.length; i++) {
      var URL = await categoriesNetwork
          .getCategorisImg(categoriesNetworkData[i]['logoIMG']);
      print(URL);
      categorydata.add(Categoryy(
          id: categoriesNetworkData[i].id,
          AR: categoriesNetworkData[i]['AR'],
          EN: categoriesNetworkData[i]['EN'],
          logoImgURL: URL));
    }
    return categorydata;
  }
}
