import 'package:androidstudiommc/views/categories_services_screans.dart';
import 'package:flutter/material.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String Logoimg;
  final Color color;
  const categoryItem(this.title, this.color, this.id, this.Logoimg,
      {super.key});
  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) {
          return CategoryserviceScreen(
            available_Services: [],
            l: [],
          );
        }),
        settings: RouteSettings(
          arguments: <String, String>{
            'id': id,
            'title': title,
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(12),
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
            Image.asset(
              Logoimg,
              height: 80,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
