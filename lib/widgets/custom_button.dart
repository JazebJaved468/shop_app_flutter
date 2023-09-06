import 'package:flutter/material.dart';

import '../constants/global_constants.dart';

class CustomButoon extends StatelessWidget {
  const CustomButoon({super.key});

  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    return Container(
      width: mediaWidth * 0.4,
      height: 60,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: GlobalColors.primaryBackground,
          width: 1,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () {},
        child: const Text("Add To Cart"),
      ),
    );
  }
}
