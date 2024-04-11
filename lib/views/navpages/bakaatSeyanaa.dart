import 'package:flutter/material.dart';

GlobalKey<NavigatorState> bakaatSeyanaaNavigatorKey = GlobalKey<NavigatorState>();

class bakaatSeyanaa extends StatelessWidget {
  const bakaatSeyanaa({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Center(child: Text('لا توجد باقات صيانة حاليا')));
  }
}
