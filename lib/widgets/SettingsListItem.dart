import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final void Function()? onTap;
  final bool links;
  SettingsListItem(this.iconData, this.title, this.onTap,
      {super.key, this.links = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Column(
        children: [
          Container(
            decoration: (links == false)
                ? const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black54)))
                : null,
            child: Padding(
              padding: (links == false)
                  ? const EdgeInsets.symmetric(vertical: 15)
                  : const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                children: [
                  (iconData != null)
                      ? Icon(
                          iconData,
                          color: Colors.black45,
                        )
                      : SizedBox(),
                  const SizedBox(
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
