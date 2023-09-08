import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/screens/productDetailScreen/prod_detail_screen.dart';
import 'package:shopping_app/screens/shopScreen/widgets/custom_filter_options.dart';
import 'package:shopping_app/widgets/add_to_cart_custom_button.dart';
import 'package:shopping_app/widgets/custom_appbar_actions.dart';
import 'package:shopping_app/widgets/custom_back_button.dart';

import '../../functions.dart';
// import 'constants/shop_items_screen_constants.dart';

class ShopScreen extends StatefulWidget {
  // final String shopName;

  const ShopScreen({
    super.key,
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // late List itemList;

  @override
  void initState() {
    // itemList = ConstantTexts_ShopScreen.tempData;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String shop = Selection.shopName;
    print("grid build");
    // print(itemList);

    setState(() {});
    return Scaffold(
      //app bar
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("$shop"),
        actions: [
          CustomAppBarActions(
            showSearchOption: true,
            showCartOption: true,
            cartIconColor: GlobalColors.secondaryBackground,
            cartNotificationStrokeColor: GlobalColors.primaryHeading,
            searchIconColor: GlobalColors.secondaryBackground,
          ),
        ],
      ),

      body: Column(
        children: [
          // filter
          Container(
            height: 70,
            // color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ListView.builder(
              itemCount: ApiData.data[Selection.shopIndex]['products'].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomFilterOption(
                  index: index,
                  selectedFilterIndex: Selection.filterIndex,
                  // ConstantTexts_ShopScreen.selectedFilterIndex
                  shopName: Selection.shopName,
                  // widget.shopName
                  // type:
                  //     "${ApiData.data[Selection.shopIndex]['products'][index]['type']}",
                  // ConstantTexts_ShopScreen.itemData[index]['type']
                );
              },
            ),
          ),

          //grid view
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30),

              // color: Colors.red,
              child: GridView.builder(
                itemCount: Selection.tempFilterData.length,

                // shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  mainAxisExtent: 183,
                ),
                itemBuilder: ((context, index) {
                  print(Selection.tempFilterData.length);
                  return GestureDetector(
                    onTap: () {
                      print("${Selection.filterIndex}");
// ConstantTexts_ShopScreen.selectedFilterIndex
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProdDetailScreen(
                                  itemIndex: index,
                                )),
                      );
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 20),
                          color: GlobalColors.productCardBackground,

                          //////////////////////////////////////////////
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // image container
                              Container(
                                // color: Colors.yellowAccent,
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: NetworkImage(
                                        Selection.tempFilterData[index]
                                            ['image'],
                                      ),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              //add to cart button
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: AddToCartIcon(
                                    onPressed: () {
                                      Selection.productIndex = index;
                                      setState(() {});
                                      addToCart(
                                          shopIndex: Selection.shopIndex,
                                          filterIndex: Selection.filterIndex,
                                          productIndex: Selection.productIndex);
                                      // showing Message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Item added to cart...'),
                                          duration: Duration(
                                              seconds:
                                                  1), // How long the SnackBar will be displayed
                                        ),
                                      );
                                    },
                                  )),

                              Container(
                                // color: Colors.redAccent,
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //title
                                      Text(
                                        "${toSentenceCase(
                                          Selection.tempFilterData[index]
                                              ['name'],
                                        )}",
                                        style: TextStyle(
                                            color: GlobalColors.primaryTitle,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      //type
                                      Text(
                                        "Organic",
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
      ),
    );
  }
}
