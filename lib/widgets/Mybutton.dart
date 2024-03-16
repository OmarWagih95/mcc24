import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '/widgets/mytext.dart';

class Mybutton extends StatelessWidget {
  void Function()? onPressed;
  bool extended;
  final String img;
  String? text;
  Mybutton({
    this.onPressed,
    super.key,
    this.extended = false,
    required this.img,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: (!extended) ? 80 : 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: ColorsManager.mainColor,
          ),
          child: Padding(
              padding: EdgeInsets.all(0),
              child: (!extended)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(image: AssetImage(img)))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: mytext(
                            text!,
                            color: Colors.white,
                          ),
                        ),
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: Image(image: AssetImage(img)))
                      ],
                    ))),
    );
  }
}
