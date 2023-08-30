import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/screen2/constants/screen2_constants.dart';
import 'package:shopping_app/screens/screen2/widgets/custom_discount_cards.dart';
import 'package:shopping_app/screens/screen2/widgets/custom_drop_down.dart';
import 'package:shopping_app/screens/screen2/widgets/custom_recommended_products.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: GlobalColors.primaryBackground,
        title: Text(ConstantTexts_Screen2.greeting,
            style: ConstantStyles_Screen2.appbarTitle),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(ConstantSVGPaths_Screen2.appbarIconSVG)),
        ],
      ),
      body: Column(children: [
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
                    decoration: ConstantStyles_Screen2.searchInput),
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
                        ConstantTexts_Screen2.dropDownDeliveryLabel,
                        style: ConstantStyles_Screen2.dropDownLabel,
                      ),
                      CustomDropDownMenu(
                          defaultValue: Dropdown.deliveryDefaultValue,
                          optionsList: Dropdown.deliveryOptions)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ConstantTexts_Screen2.dropDownTimeLabel,
                          style: ConstantStyles_Screen2.dropDownLabel),
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
        Container(
          padding: const EdgeInsets.only(top: 25, left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
