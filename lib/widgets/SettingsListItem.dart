import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final onTap;

  SettingsListItem(this.iconData, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black54))),
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
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
