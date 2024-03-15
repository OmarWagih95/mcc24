// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, unnecessary_import, prefer_const_constructors_in_immutables

import 'package:MCC/views/Service_detail_screen.dart';
import '/views/Service_detail_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Service_item extends StatelessWidget {
  @required
  final String id;
  @required
  final String title;

  Service_item({
    required this.title,
    required this.id,
  });
  void selectMeals(BuildContext context) {
    Navigator.of(context).pushNamed(
      ServiceDetailScreen.routeName,
      arguments: <String, String>{
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeals(context),
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 4, //for Shadow
              margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.asset(
                          '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 15,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(15)),
                          width: 220,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          child: Text(title + '',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 25),
                              softWrap: true,
                              overflow: TextOverflow.fade),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.schedule),
                              SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.attach_money),
                              SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.work),
                              SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
