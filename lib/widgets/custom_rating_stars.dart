import 'package:flutter/material.dart';
// import 'package:shopping_app/data/data.dart';

import '../constants/global_constants.dart';

class CustomRatingStars extends StatelessWidget {

  final num rating;
  const CustomRatingStars({
    super.key,

    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    // int rating = ApiData.data[shopIndex]['products'][filterIndex]['items'][productIndex]['rating'];
    return SizedBox(
      height: 20,
      width: 100,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star_rate_rounded,
            size: 15,
            color: index + 1 <= rating
                ? GlobalColors.yellow
                : GlobalColors.secondaryBackground,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 3,
          );
        },
      ),
    );
  }
}
