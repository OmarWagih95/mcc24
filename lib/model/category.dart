import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;

  final String? LogoimgURL;
  final Color color;
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.blue,
    this.LogoimgURL,
  });
}

class Categoryy {
  final String id;
  final String? title;
  final Map<String, dynamic> AR;
  final Map<String, dynamic> EN;
  final String? logoImgURL;
  final Color color;
  Categoryy({
    this.title,
    required this.id,
    required this.AR,
    required this.EN,
    this.color = Colors.blue,
    this.logoImgURL,
  });
}
