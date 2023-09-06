import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/homeScreen/constants/home_constants.dart';
import 'package:shopping_app/screens/homeScreen/widgets/custom_discount_cards.dart';
import 'package:shopping_app/screens/homeScreen/widgets/custom_drop_down.dart';
import 'package:shopping_app/screens/homeScreen/widgets/custom_recommended_products.dart';
import 'package:shopping_app/widgets/custom_cart_icon.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // greetings
        Container(
          height: 80,
          padding: EdgeInsets.only(left: 14, right: 5),
          color: GlobalColors.primaryBackground,
          child: Row(children: [
            Text(ConstantTexts_Home.greeting,
                style: ConstantStyles_Home.appbarTitle),
            Expanded(
              child: Container(
                height: 2,
                color: Colors.transparent,
              ),
            ),

            //cart icon
            CustomCartIcon(),
          ]),
        ),

        // search bar and drop downs
        Container(
          padding:
              const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
          margin: const EdgeInsets.all(0),
          color: GlobalColors.primaryBackground,
          child: Column(
            children: [
              //Search
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

              // Drop down
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

        // discount cards and recommended products
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
