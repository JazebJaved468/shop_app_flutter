import 'package:flutter/material.dart';
import 'package:shopping_app/screens/screen1/constants/screen1_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeading extends StatelessWidget {
  final String textLine1;
  final String textLine2;
  final String textLine3;
  final String textLine4;
  final String? svgPath;

  const CustomHeading({
    super.key,
    required this.textLine1,
    required this.textLine2,
    required this.textLine3,
    required this.textLine4,
    this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textLine1,
            style: ConstantStyles.headingStyle,
          ),
          Text(
            textLine2,
            style: ConstantStyles.headingStyle,
          ),
          Text(
            textLine3,
            style: ConstantStyles.headingStyle,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textLine4,
                style: ConstantStyles.headingStyle,
              ),
              SizedBox(
                width: 40,
              ),
              SvgPicture.asset(svgPath ?? ConstantSVGPaths.headingSVG),
            ],
          ),
        ],
      ),
    );
  }
}
