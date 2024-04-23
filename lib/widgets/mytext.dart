import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mylargetext extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  mylargetext(this.text,
      {super.key, this.size = 30, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class mytext extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  mytext(this.text, {super.key, this.size = 16, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.displayMedium!.copyWith());
  }
}
