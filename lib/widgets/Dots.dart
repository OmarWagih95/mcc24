import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Dots extends StatelessWidget {
  int Pageindex;

  Dots({super.key, required this.Pageindex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            4,
            (index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Container(
                  height: 8,
                  width: (Pageindex == index) ? 20 : 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (Pageindex == index)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(0.3)),
                )))
      ],
    );
  }
}
