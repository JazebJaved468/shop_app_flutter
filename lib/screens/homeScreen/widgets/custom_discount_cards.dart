import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/homeScreen/constants/home_constants.dart';

class CustomDiscountCards extends StatelessWidget {
  const CustomDiscountCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: 130,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (index % 2) == 0
                  ? ConstantColors_Home.cardPrimaryBackground
                  : ConstantColors_Home.cardSecondaryBackground,
            ),
            width: 270,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage(
                          ConstantTexts_Home.discountCardsData[index]['image']),
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get",
                        style: TextStyle(
                            color: (index % 2) == 0
                                ? GlobalColors.primaryHeading
                                : GlobalColors.primaryTitle,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "${ConstantTexts_Home.discountCardsData[index]['discount']}% OFF ",
                        style: TextStyle(
                          color: (index % 2) == 0
                              ? GlobalColors.primaryHeading
                              : GlobalColors.primaryTitle,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "On first ${ConstantTexts_Home.discountCardsData[index]['products']} order",
                        style: TextStyle(
                            color: (index % 2) == 0
                                ? GlobalColors.primaryHeading
                                : GlobalColors.primaryTitle,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        // separatorBuilder: (context, index) {
        //   return const SizedBox(
        //     width: 18,
        //   );
        // },
      ),
    );
  }
}
