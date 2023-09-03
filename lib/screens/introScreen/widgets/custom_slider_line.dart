import 'package:flutter/material.dart';

class CustomSlidingLine extends StatelessWidget {
  final double? lineWidth ;
  final double? lineHeight ;
  final Color? lineColor;
  final double? lineBorderRadius;
  const CustomSlidingLine({super.key, this.lineWidth, this.lineHeight, this.lineColor, this.lineBorderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(lineBorderRadius ?? 30),
                          color: lineColor ?? Color.fromARGB(113, 208, 208, 208),
                        ),
                        width: lineWidth ?? 25,
                        height: lineHeight ?? 4,
                      );
  }
}