// import 'dart:developer';
//
// import 'package:MCC/model/Services.dart';
// import 'package:MCC/widgets/Service_item.dart';
// import 'package:flutter/material.dart';
//
// class CategoryserviceScreen extends StatefulWidget {
//   static String routeName = "CategoryserviceScreen";
//   final List<String> l;
//   final List<Services> available_Services;
//   CategoryserviceScreen(
//       {required this.available_Services, required this.l, super.key});
//
//   @override
//   State<CategoryserviceScreen> createState() => CategoryMealsScreanState();
// }
//
// class CategoryMealsScreanState extends State<CategoryserviceScreen> {
//   bool emptyService = false;
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     final String categoryId = routeArgs['id'] ?? '';
//     // print('data is ' + '$routeArgs' + '$categoryId');
//     final String categoryTitle = routeArgs['title'] ?? '';
//     List<Services> categoryServices =
//         widget.available_Services.where((Services) {
//       var x = Services.id.contains(categoryId);
//       return x;
//     }).toList();
//
//     // print('data is ' + '$categoryServices' + '$categoryId');
//
//     if (categoryServices.isEmpty) {
//       setState(() {
//         emptyService = true;
//       });
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//       ),
//       body: (!emptyService)
//           ? ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: categoryServices.length,
//               itemBuilder: (context, index) {
//                 return Service_item(
//                   title: categoryServices[index].title,
//                   id: categoryServices[index].id,
//                 );
//               })
//           : Center(
//               child: Text(
//               ' this category doesnt have ${widget.l} ',
//               style: const TextStyle(fontSize: 48),
//             )),
//     );
//   }
// }
