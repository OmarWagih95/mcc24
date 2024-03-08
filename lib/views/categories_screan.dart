// ignore: camel_case_types
import 'package:androidstudiommc/model/category.dart';
import 'package:flutter/material.dart';
import '/widgets/category_item.dart';
import '/model/dummyData.dart';

class categoriesScreen extends StatelessWidget {
  categoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(0),
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemBuilder: (context, index) => categoryItem(
              DUMMY_CATEGORIES[index].title,
              DUMMY_CATEGORIES[index].color,
              DUMMY_CATEGORIES[index].id,
              DUMMY_CATEGORIES[index].Logoimg!),
          itemCount: DUMMY_CATEGORIES.length,
        ));
  }
}
