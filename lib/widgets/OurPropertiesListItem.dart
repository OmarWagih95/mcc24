import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OurProvidingListItem extends StatelessWidget {
IconData iconData;
String title;
OurProvidingListItem(this.iconData,this.title);
  @override
  Widget build(BuildContext context) {
    return                 Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black45,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 15.w, color: Colors.black87),
            )
          ],
        ),
      ),
    );

  }
}
