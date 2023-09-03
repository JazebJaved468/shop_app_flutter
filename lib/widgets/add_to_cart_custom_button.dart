import 'package:flutter/material.dart';

import '../constants/global_constants.dart';

class AddToCartIcon extends StatelessWidget {
  const AddToCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: GlobalColors.primaryBackground,
        width: 26,
        height: 26,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 14,
            color: GlobalColors.primaryHeading,
          ),
        ),
      ),
    );
  }
}
