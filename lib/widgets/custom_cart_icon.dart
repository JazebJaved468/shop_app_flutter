import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/global_constants.dart';
import '../screens/homeScreen/constants/home_constants.dart';

class CustomCartIcon extends StatelessWidget {
  final Color? iconColor;
  final Color? strokeColor;
  const CustomCartIcon({super.key, this.iconColor, this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return //cart icon
        Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          // color: Colors.green,
        ),
        IconButton(
          alignment: Alignment.centerRight,
          onPressed: () {},
          icon: SvgPicture.asset(
            ConstantSVGPaths_Home.cartIconSVG,
            color: iconColor ?? GlobalColors.primaryHeading,
          ),
        ),
        Positioned(
          top: 8,
          right: 5,
          child: CircleAvatar(
            backgroundColor: strokeColor ?? GlobalColors.primaryBackground,
            radius: 9,
            child: CircleAvatar(
              backgroundColor: Color(0xffF9B023),
              foregroundColor: GlobalColors.primaryHeading,
              radius: 8,
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
