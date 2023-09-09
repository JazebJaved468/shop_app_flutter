// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/homeScreen/constants/home_constants.dart';
import 'package:shopping_app/screens/homeScreen/widgets/custom_discount_cards.dart';
import 'package:shopping_app/screens/homeScreen/widgets/custom_drop_down.dart';
import 'package:shopping_app/screens/homeScreen/widgets/custom_recommended_products.dart';
import 'package:shopping_app/widgets/custom_cart_icon.dart';

import '../../../data/data.dart';
import '../../../functions.dart';
import '../../../widgets/add_to_cart_custom_button.dart';

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
                //  CustomRcommendedProducts(),
                Container(
                  height: 229,
                  // color: Colors.red,
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          width: 150,
                          color: GlobalColors.productCardBackground,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // image container
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                // color: Colors.yellowAccent,
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: AssetImage(
                                        RecommendedData.data[index]['imgPath'],
                                      ),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              //line
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                width: 100,
                                height: 2,
                                color: Color(0xffE0E2EE),
                              ),

                              Container(
                                // color: Colors.redAccent,
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 14, top: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //title
                                      Text(
                                        "${RecommendedData.data[index]['name']}",
                                        style: TextStyle(
                                            color: GlobalColors.primaryTitle,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis),
                                      ),

                                      //type
                                      Text(
                                        "Fast Food",
                                        style: TextStyle(
                                          color: GlobalColors.primaryTitle,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              Container(
                                                // color: Colors.pink,
                                                margin: EdgeInsets.only(
                                                    left: 12,
                                                    top: 3,
                                                    bottom: 3,
                                                    right: 20),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Unit ",
                                                      style: TextStyle(
                                                          color: GlobalColors
                                                              .primaryTitle,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Text(
                                                      "\$${RecommendedData.data[index]['price']}",
                                                      style: TextStyle(
                                                          color: GlobalColors
                                                              .primaryTitle,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              AddToCartIcon(
                                                onPressed: () {
                                                  Selection.shopIndex =
                                                      RecommendedData
                                                              .data[index]
                                                          ['shopIndex'];
                                                  Selection.filterIndex =
                                                      RecommendedData
                                                              .data[index]
                                                          ['filterIndex'];
                                                  Selection.productIndex =
                                                      RecommendedData
                                                              .data[index]
                                                          ['productIndex'];
                                                  setState(() {});
                                                  addToCart(
                                                      shopIndex:
                                                          Selection.shopIndex,
                                                      filterIndex:
                                                          Selection.filterIndex,
                                                      productIndex: Selection
                                                          .productIndex);
                                                  // showing Message
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Item added to cart...'),
                                                      duration: Duration(
                                                          seconds:
                                                              1), // How long the SnackBar will be displayed
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
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
                  ),
                )

                //extrass  //extrass  //extrass  //extrass  //extrass  //extrass
              ],
            ),
          ),
        ),
      ],
    );
  }
}
