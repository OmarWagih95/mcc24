import 'package:MCC/model/Services.dart';
import 'package:MCC/model/dummyData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/LanguagesCupit.dart';

class ServiceDetailScreen extends StatelessWidget {
  var DUMMY_CATEGORIES = [];
  static const routeName = '/meal-detail';
  Widget MyContainer(child) {
    return Container(
      child: child,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: 300,
    );
  }

  Widget TextWidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DUMMY_CATEGORIES = DUMMY_CATEGORIES_(context);
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String MealId = routeArgs['id'] ?? '';
    final Services = DUMMY_CATEGORIES.firstWhere((meal) => meal.id == MealId);
    return Scaffold(
      appBar: AppBar(title: Text('hi')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                '',
                fit: BoxFit.cover,
              ),
            ),
            TextWidget(context, 'ingredients'),
            MyContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    color: Theme.of(context).hintColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('htghghg'),
                    ));
              },
              itemCount: DUMMY_CATEGORIES.length,
            )),
            TextWidget(context, 'Steps'),
            MyContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  //column for divider
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: Text(' #${index + 1}'),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text('jkjl'),
                        )),
                    const Divider()
                  ],
                );
              },
              itemCount: DUMMY_CATEGORIES.length,
            )),
          ],
        ),
      ),
    );
  }
}
