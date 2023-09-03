import 'package:flutter/material.dart';

import '../../constants/global_constants.dart';
import '../homeScreen/constants/home_constants.dart';
import '../homeScreen/widgets/custom_discount_cards.dart';
import '../homeScreen/widgets/custom_drop_down.dart';
import '../homeScreen/widgets/custom_recommended_products.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen1"),
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            margin: const EdgeInsets.all(0),
            color: GlobalColors.primaryBackground,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                      style: TextStyle(
                        color: GlobalColors.primaryHeading,
                      ), // Text color
                      decoration: ConstantStyles_Home.searchInput),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantTexts_Home.dropDownDeliveryLabel,
                          style: ConstantStyles_Home.dropDownLabel,
                        ),
                        CustomDropDownMenu(
                            defaultValue: Dropdown.deliveryDefaultValue,
                            optionsList: Dropdown.deliveryOptions)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ConstantTexts_Home.dropDownTimeLabel,
                            style: ConstantStyles_Home.dropDownLabel),
                        CustomDropDownMenu(
                            defaultValue: Dropdown.timeDefaultValue,
                            optionsList: Dropdown.timeOptions)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                shrinkWrap: true,
                children: [
                  // Discount Cards
                  const CustomDiscountCards(),
                  const SizedBox(
                    height: 30,
                  ),

                  // Recommended
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.primaryTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Recommended Products
                  const CustomRcommendedProducts(),

                  //extrass  //extrass  //extrass  //extrass  //extrass  //extrass
                  // Recommended
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.primaryTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Recommended Products
                  const CustomRcommendedProducts(), // Recommended
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.primaryTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Recommended Products
                  const CustomRcommendedProducts(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
