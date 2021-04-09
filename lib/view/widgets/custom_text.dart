import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text ;
  final Color color ;
  final FontWeight fontWeight;
  final double fontSize;
  final Alignment alignment;
  final double height ;
  CustomText(
      {this.text="",
        this.color=Colors.black,
        this.fontSize=16,
        this.alignment= Alignment.topLeft,
        this.fontWeight,
        this.height,
      }
        );
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
       child: Text(
            text,
            style:TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight:fontWeight,
              height: height,
            )
        )
    );
  }


}
