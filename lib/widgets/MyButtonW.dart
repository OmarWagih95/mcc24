import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
final  onClick ;
final String text;
final Color textColor;
final Color buttonColor;

MyButton({required this.text,required this.onClick,required this.textColor,required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.fromLTRB(15, 7,15,20),
      child: GestureDetector(onTap: onClick,
        // style: TextButton.styleFrom(
        //     backgroundColor: buttonColor,
        //     foregroundColor: textColor,
        //
        // ),
        child: Container(
          decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding:  EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    text
                ,style: TextStyle(fontSize:18,color: textColor),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

