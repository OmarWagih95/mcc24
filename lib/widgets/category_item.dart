import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/views/servicesScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category.dart';

class categoryItem extends StatelessWidget {
  final Categoryy categoryy;
  final Color color;

  categoryItem(
    this.categoryy,
    this.color,
  );

  // categoryItem(this.title, this.color, this.id, this.logoImg,)
  // void selectCategory(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: ((context) {
  //         return CategoryserviceScreen(
  //           available_Services: [],
  //           l: [],
  //         );
  //       }),
  //       settings: RouteSettings(
  //         arguments: <String, String>{
  //           'id': id,
  //           'title': title,
  //         },
  //       )));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked');
        try {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => ServicesCubit(),
                        child: ServicesScreen(categoryy),
                      )));
        } catch (e) {
          print(e);
        }
      },
      child: Container(
        foregroundDecoration: BoxDecoration(),
        padding: EdgeInsets.all(
            2), ////need to changed with better code for text size
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              categoryy.logoImgURL!,
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Localizations.localeOf(context).languageCode=='en'
                  ? Text(
                      categoryy.EN['categoryName'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Text(
                      categoryy.AR['categoryName'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
