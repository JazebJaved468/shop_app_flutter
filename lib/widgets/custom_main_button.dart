import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final double width;
  final double? height;

  const CustomMainButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      this.borderColor,
      required this.textColor,
      required this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    // Media Queries
    // var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height ?? 60,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 1,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
