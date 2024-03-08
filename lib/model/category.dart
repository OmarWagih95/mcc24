
import 'package:flutter/material.dart';

class Category {
  
  final String id;
  final String title;
  final String? Logoimg;
  final Color color;
  const Category( {
    required this.id,
    required this.title,
      this.color=Colors.blue,this.Logoimg,});
}
