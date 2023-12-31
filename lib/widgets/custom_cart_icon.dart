import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:shopping_app/functions.dart';

import '../constants/global_constants.dart';
import '../data/data.dart';
import '../screens/cartScreen/cart_screen.dart';
// import '../screens/cartScreen/full_cart_screen.dart';
import '../screens/homeScreen/constants/home_constants.dart';

class CustomCartIcon extends StatefulWidget {
  final Color? iconColor;
  final Color? strokeColor;
  const CustomCartIcon({super.key, this.iconColor, this.strokeColor});

  @override
  State<CustomCartIcon> createState() => _CustomCartIconState();
}

class _CustomCartIconState extends State<CustomCartIcon> {
  @override
  Widget build(BuildContext context) {
    return //cart icon
        Stack(
      children: [
        const SizedBox(
          width: 40,
          height: 40,
          // color: Colors.green,
        ),
        IconButton(
          alignment: Alignment.center,
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
            setState(() {});
          },
          icon: SvgPicture.asset(
            ConstantSVGPaths_Home.cartIconSVG,
            // ignore: deprecated_member_use
            color: widget.iconColor ?? GlobalColors.primaryHeading,
          ),
        ),
        Positioned(
          top: 8,
          right: 5,
          child: CircleAvatar(
            backgroundColor:
                widget.strokeColor ?? GlobalColors.primaryBackground,
            radius: 9,
            child: CircleAvatar(
              backgroundColor: GlobalColors.yellow,
              foregroundColor: GlobalColors.primaryHeading,
              radius: 8,
              child: Center(
                child: Text(
                  "${CartData.data.length}",
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
