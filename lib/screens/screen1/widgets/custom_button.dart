import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/screens/screen1/constants/screen1_constants.dart';
import 'package:shopping_app/screens/screen2/screen2.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? svgPath;
  final double? svgSize;
  final Color? backgroundColor;
  final Color? textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;
  const CustomButton({
    super.key,
    this.svgPath,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
    this.svgSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 10, vertical: verticalPadding ?? 0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Screen2()),
          );
        },
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
            SizedBox(
              width: 30,
            ),
            SvgPicture.asset(
              svgPath ?? ConstantSVGPaths_Screen1.buttonSVG,
              width: svgSize ?? 16,
            ),
          ],
        ),
      ),
    );
  }
}
