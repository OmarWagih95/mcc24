import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/views/servicesScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/category.dart';

class categoryItem extends StatelessWidget {
  final Categoryy categoryy;
  final Color color;

  categoryItem(
    this.categoryy,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('clicked');
        try {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) =>
                            ServicesCubit()..getServicesData(categoryy.id),
                        child: ServicesScreen(categoryy),
                      )));
        } catch (e) {
          debugPrint('$e');
        }
      },
      child: Container(
        foregroundDecoration: BoxDecoration(),
        padding: EdgeInsets.all(
            2), ////need to changed with better code for text size
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            color: color,
            // gradient: LinearGradient(
            //     colors: [color.withOpacity(0.7), color],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              categoryy.logoImgURL!,
              height: 80.h,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Localizations.localeOf(context).languageCode == 'en'
                    ? Text(categoryy.EN['categoryName'],
                        style: Theme.of(context)
                            .textTheme!
                            .titleSmall!
                            .merge(GoogleFonts.aBeeZee()))
                    : Text(categoryy.AR['categoryName'],
                        style: Theme.of(context)
                            .textTheme!
                            .titleSmall!
                            .merge(GoogleFonts.aBeeZee())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
