import 'package:flutter/material.dart';

import '../constants/global_constants.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final double width;
  final double? height;
  final void Function()? onPressed;

  const CustomMainButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      this.borderColor,
      required this.textColor,
      required this.width,
      this.height,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
     Color borderDefault = backgroundColor!;
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
          color: borderColor ?? borderDefault,
          width: 1,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ??  GlobalColors.primaryBackground,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: onPressed,
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
