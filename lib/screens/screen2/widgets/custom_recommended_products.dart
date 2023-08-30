import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/screen2/constants/screen2_constants.dart';

class CustomRcommendedProducts extends StatelessWidget {
  const CustomRcommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: GlobalColors.productCardBackground,
                width: 100,
                height: 300,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(ConstantTexts_Screen2
                              .discountCardsData[index]['image']),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "fresh Lemon",
                        style: TextStyle(
                            color: GlobalColors.primaryTitle,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Organic",
                        style: TextStyle(
                          color: GlobalColors.primaryTitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Unit \$12",
                        style: TextStyle(
                            color: (index % 2) == 0
                                ? GlobalColors.primaryHeading
                                : GlobalColors.primaryTitle,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 18,
            );
          },
          itemCount: 3),
    );
  }
}
