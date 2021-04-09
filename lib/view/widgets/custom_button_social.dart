import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomButtonSocial extends StatelessWidget {
   final String text;

   final String  imageName;

   final Function onPressed;


   CustomButtonSocial({this.text, this.imageName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration
        (
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),

      child: FlatButton(
        onPressed: onPressed,
        child: Row(children: [
          Image.asset(imageName),
          SizedBox(
            width: 60,
          ),
            CustomText(
              text: text,
            ),
        ],
        ),
      ),
    );
  }
}
