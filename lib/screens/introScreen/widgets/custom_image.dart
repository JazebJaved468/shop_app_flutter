import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imgPath;
  final double? imgWidth;
  final double? imgHeight;
  final double? borderRadius;

  const CustomImage(
      {super.key,
      required this.imgPath,
      this.imgWidth,
      this.imgHeight,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          width: imgWidth ?? 200,
          height: imgHeight,
          image: AssetImage(imgPath),
        ),
      ),
    );
  }
}
