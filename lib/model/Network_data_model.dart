import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryyModel {
  final String id;
  final String? title;
  final Map<String, dynamic> AR;
  final Map<String, dynamic> EN;
  final String? logoImgURL;
  final Color color;

  CategoryyModel({
    this.title,
    required this.id,
    required this.AR,
    required this.EN,
    this.color = Colors.blue,
    this.logoImgURL,
  });

  factory CategoryyModel.fromFirebase(
      QueryDocumentSnapshot data, String?categorisImg) {
    return CategoryyModel(
        id: data.id,
        AR: data['AR'],
        EN: data['EN'],
        logoImgURL: '$categorisImg');
  }
}
