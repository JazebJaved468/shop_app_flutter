import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/screen2/constants/screen2_constants.dart';

class CustomRcommendedProducts extends StatelessWidget {
  const CustomRcommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                color: GlobalColors.productCardBackground,
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      padding: EdgeInsets.all(20),
                      color: Colors.yellowAccent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(ConstantTexts_Screen2
                              .discountCardsData[index]['image']),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.redAccent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: GlobalColors.primaryTitle,
                              width: 100,
                              height: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "fresh Lemon",
                              style: TextStyle(
                                  color: GlobalColors.primaryTitle,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Organic",
                                  style: TextStyle(
                                    color: GlobalColors.primaryTitle,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  "Unit \$12",
                                  style: TextStyle(
                                      color: GlobalColors.primaryTitle,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 18,
            );
          },
          itemCount: 2),
    );
  }
}
