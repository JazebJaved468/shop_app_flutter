import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';

import '../screens/homeScreen/constants/home_constants.dart';

class CustomSearchIcon extends StatelessWidget {
  final Color? iconColor;
  const CustomSearchIcon({super.key, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        ConstantSVGPaths_Home.searchIconSVG,
        color: iconColor ?? GlobalColors.primaryHeading,
      ),
    );
  }
}
