import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/screens/homeScreen/constants/home_constants.dart';
// import 'package:shopping_app/screens/homeScreen/widgets/custom_discount_cards.dart';
// import 'package:shopping_app/screens/homeScreen/widgets/custom_drop_down.dart';
// import 'package:shopping_app/screens/homeScreen/widgets/custom_recommended_products.dart';
// import 'package:shopping_app/screens/shopScreen/constants/shop_screen_constants.dart';
import 'package:shopping_app/screens/shopScreen/shop_items_screen.dart';
import 'package:shopping_app/widgets/custom_cart_icon.dart';
import 'package:shopping_app/widgets/custom_search_icon.dart';

import '../../../functions.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // greetings
        Container(
          height: 80,
          padding: EdgeInsets.only(left: 14, right: 5),
          color: GlobalColors.primaryBackground,
          child: Row(
            children: [
              Text(ConstantTexts_Home.greeting,
                  style: ConstantStyles_Home.appbarTitle),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
              ),

              // search icon
              CustomSearchIcon(),

              //cart icon
              CustomCartIcon(),
            ],
          ),
        ),

        // shop by category title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14, right: 25, bottom: 20),
          margin: EdgeInsets.zero,
          color: GlobalColors.primaryBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shop",
                style: TextStyle(
                  color: GlobalColors.primaryHeading,
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "By Restaurants",
                style: TextStyle(
                  color: GlobalColors.primaryHeading,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  wordSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        //grid view
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),

            // color: Colors.red,
            child: GridView.builder(
              itemCount: ApiData.data.length,
              // ConstantTexts_ShopScreen.shopNames.length
              // shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                mainAxisExtent: 180,
              ),
              itemBuilder: ((context, index) {
                String shopName = toSentenceCase(
                  ApiData.data[index]['name'],
                );
                // ConstantTexts_ShopScreen.shopNames[index]
                return GestureDetector(
                  onTap: () async {
                    print("$shopName");

                    // Taking shop index to another separate file that is been clicked
                    Selection.shopIndex = index;
                    String? refresh = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopScreen()),
                    );

                    if (refresh == 'r' || refresh == null) {
                      setState(() {});
                    }
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        color: GlobalColors.productCardBackground,

                        //////////////////////////////////////////////
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // image container
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              // color: Colors.yellowAccent,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: AssetImage(
                                      ApiData.data[index]['image'],
                                    ),
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            //line
                            Container(
                              width: 100,
                              height: 2,
                              color: Color(0xffE0E2EE),
                            ),

                            Container(
                              // color: Colors.redAccent,
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //title
                                    Text(
                                      "${shopName}",
                                      style: TextStyle(
                                          color: GlobalColors.primaryTitle,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),

                                    //type
                                    Text(
                                      "Restaurant",
                                      style: TextStyle(
                                        color: GlobalColors.primaryTitle,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      )),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
