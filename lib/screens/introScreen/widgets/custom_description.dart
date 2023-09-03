import 'package:flutter/material.dart';
import 'package:shopping_app/screens/introScreen/constants/intro_constants.dart';

class CustomDescription extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;
  const CustomDescription(
      {super.key, required this.text, this.textSize, this.textColor, this.textWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 30),
      child: Text(
        text,
        style: TextStyle(
            fontSize: textSize ?? 18,
            color: textColor ?? ConstantColors_Intro.descriptionColor,
            fontWeight: textWeight ?? FontWeight.w400,),
      ),
    );
  }
}
