import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/shopScreen/widgets/custom_filter_options.dart';
import 'package:shopping_app/widgets/add_to_cart_custom_button.dart';
import 'package:shopping_app/widgets/custom_appbar_actions.dart';
import 'package:shopping_app/widgets/custom_back_button.dart';
import 'package:shopping_app/widgets/custom_cart_icon.dart';
import 'package:shopping_app/widgets/custom_search_icon.dart';

import '../../functions.dart';
import 'constants/shop_screen_constants.dart';

class ShopScreen extends StatefulWidget {
  final String shopName;

  const ShopScreen({super.key, required this.shopName});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late List itemList;

  @override
  void initState() {
    itemList = ConstantTexts_ShopScreen.tempData;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("grid build");
    print(itemList);

    setState(() {});
    return SafeArea(
      child: Scaffold(
        //app bar
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: Text("${widget.shopName}"),
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
              height: 50,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomFilterOption(
                    index: index,
                    selectedFilterIndex:
                        ConstantTexts_ShopScreen.selectedFilterIndex,
                    shopName: widget.shopName,
                    type: "${ConstantTexts_ShopScreen.itemData[index]['type']}",
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
                  itemCount: itemList.length,
                  // shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 183,
                  ),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 22),
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
                                        image: AssetImage(
                                            'assets/images/discount1.jpg'),
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
                                    child: AddToCartIcon()),

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
                                          "${toSentenceCase(itemList[index]['name'])}",
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
      ),
    );
  }
}
