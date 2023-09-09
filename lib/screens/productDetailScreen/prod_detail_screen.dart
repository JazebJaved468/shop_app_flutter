import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cartScreen/cart_screen.dart';
import 'package:shopping_app/screens/productDetailScreen/constants/prod_detail_screen_constants.dart';
import 'package:shopping_app/widgets/custom_main_button.dart';
import 'package:shopping_app/widgets/custom_rating_stars.dart';

import '../../constants/global_constants.dart';
import '../../data/data.dart';
import '../../functions.dart';
import '../../widgets/custom_appbar_actions.dart';
import '../../widgets/custom_back_button.dart';
// import '../shopScreen/constants/shop_items_screen_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdDetailScreen extends StatefulWidget {
  final int itemIndex;
  const ProdDetailScreen({super.key, required this.itemIndex});

  @override
  State<ProdDetailScreen> createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  //controller
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  //getting filterindex and itemdatalist
  // List itemData = ConstantTexts_ShopScreen.itemData;
  // int typeIndex = ConstantTexts_ShopScreen.selectedFilterIndex;
  @override
  Widget build(BuildContext context) {
    // Setting (Saving) Selected Product Index
    Selection.productIndex = widget.itemIndex;

    //favourite
    bool isFavourite = isFavouriteAlready(
        shopIndex: Selection.shopIndex,
        filterIndex: Selection.filterIndex,
        productIndex: Selection.productIndex)[0];

    // Setting Variables
    var shop = ApiData.data[Selection.shopIndex];
    var filter = shop['products'][Selection.filterIndex];
    var product = filter['items'][Selection.productIndex];
    num rating = product['rating'];

    // ignore: avoid_print
    // print("${Selection.productIndex}");
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;
    final pages = List.generate(
        3,
        (index) => Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage(
                      product['image'],
                    ),
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "${toSentenceCase(product['name'])}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          CustomAppBarActions(
            showSearchOption: false,
            showCartOption: true,
            cartIconColor: GlobalColors.secondaryBackground,
            cartNotificationStrokeColor: GlobalColors.primaryHeading,
          ),
        ],
      ),
      body:
          // Product Images
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 4,
                  dotWidth: 10,
                  dotColor: const Color(
                    0xffE4E4E4,
                  ),
                  activeDotColor: GlobalColors.yellow),
            ),
          ),

          // Product Detail Sheet
          Expanded(
            child: Container(
              width: mediaWidth * 1,
              decoration: BoxDecoration(
                  color: ConstantColors_ProdDetail.bottomSheet,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // main title and favourite Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // main title
                            Container(
                              // color: Colors.yellow,
                              width: mediaWidth * 0.5,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "${toSentenceCase(product['name'])}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    wordSpacing: 2),
                              ),
                            ),
                            // favourite button
                            IconButton(
                              onPressed: () {
                                // print(FavouriteData.data);
                                if (isFavourite == false) {
                                  addToFavourite(
                                      shopIndex: Selection.shopIndex,
                                      filterIndex: Selection.filterIndex,
                                      productIndex: Selection.productIndex);
                                  // showing Message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Item added to favourites !'),
                                      duration: Duration(
                                          seconds:
                                              1), // How long the SnackBar will be displayed
                                    ),
                                  );
                                  isFavourite = !(isFavourite);

                                  print(FavouriteData.data);
                                } else {
                                  // FavouriteData.data.removeLast();
                                  removeFromFavourite(
                                      shopIndex: Selection.shopIndex,
                                      filterIndex: Selection.filterIndex,
                                      productIndex: Selection.productIndex);
                                  // showing Message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Item removed from favourites.'),
                                      duration: Duration(
                                          seconds:
                                              1), // How long the SnackBar will be displayed
                                    ),
                                  );
                                  isFavourite = !(isFavourite);
                                  print(FavouriteData.data);
                                }

                                setState(() {});
                              },
                              icon: Icon(
                                isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: isFavourite ? Colors.red : Colors.black,
                                size: 26,
                              ),
                            )
                          ],
                        ),

                        // price, discount, reg
                        Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Wrap(
                                  children: [
                                    Text(
                                      "\$${product['price']}",
                                      style: TextStyle(
                                        color: GlobalColors.primaryBackground,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "/KG",
                                      style: TextStyle(
                                        color: GlobalColors.primaryBackground,
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaWidth * 0.05,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: GlobalColors.primaryBackground,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 2),
                                      child: Text(
                                        "\$${((product['price']) * (product['discount'] / 100)).toStringAsFixed(2)} OFF",
                                        style: TextStyle(
                                          backgroundColor:
                                              GlobalColors.primaryBackground,
                                          color: GlobalColors.primaryHeading,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Reg: \$${product['reg'].toStringAsFixed(2)} USD",
                                style: TextStyle(
                                  color: ConstantColors_ProdDetail.description,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Reviews
                        Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          // color: Colors.amberAccent,
                          width: mediaWidth * 1,
                          child: Row(
                            children: [
                              //Stars
                              CustomRatingStars(rating: rating),

                              // No. of reviews
                              Text(
                                "${product['reviews'].length} Reviews",
                                style: TextStyle(
                                  color: ConstantColors_ProdDetail.description,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),

                        // Details
                        Container(
                          // color: Colors.red,
                          margin: const EdgeInsets.only(bottom: 14),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              collapsedIconColor:
                                  ConstantColors_ProdDetail.description,
                              expandedAlignment: Alignment.centerLeft,
                              tilePadding: EdgeInsets.zero,
                              title: const Text(
                                "Details",
                                style: TextStyle(),
                              ),
                              children: [
                                Text(
                                  "${product['details']}",
                                  style: const TextStyle(
                                      color: Color(0xff8891A5), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Nutritional Facts
                        Container(
                          // color: Colors.red,
                          margin: const EdgeInsets.only(bottom: 14),

                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              // iconColor: ConstantColors_ProdDetail.description,
                              collapsedIconColor:
                                  ConstantColors_ProdDetail.description,

                              expandedAlignment: Alignment.centerLeft,
                              tilePadding: EdgeInsets.zero,
                              title: const Text(
                                "Nutritional Facts",
                                style: TextStyle(),
                              ),
                              children: [
                                Text(
                                  "${product['nutrition']}",
                                  style: const TextStyle(
                                      color: Color(0xff8891A5), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Reviews
                        Container(
                          // color: Colors.red,
                          margin: const EdgeInsets.only(bottom: 100),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              // iconColor: ConstantColors_ProdDetail.description,
                              collapsedIconColor:
                                  ConstantColors_ProdDetail.description,

                              expandedAlignment: Alignment.centerLeft,
                              tilePadding: EdgeInsets.zero,
                              initiallyExpanded: false,
                              title: const Text(
                                "Reviews",
                                style: TextStyle(),
                              ),
                              children: [
                                Container(
                                  color:
                                      const Color.fromARGB(255, 231, 231, 236),
                                  height: 230,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: product['reviews'].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                              backgroundColor: GlobalColors
                                                  .productCardBackground,
                                              radius: 16,
                                              child: Icon(
                                                Icons.person,
                                                size: 20,
                                                color: GlobalColors
                                                    .secondaryBackground,
                                              )),
                                          title: Text(
                                            "${product['reviews'][index]['comment']}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          subtitle: Text(
                                            "By ${product['reviews'][index]['personName']}",
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          trailing: Text(
                                            "${product['reviews'][index]['date']}",
                                            style: TextStyle(
                                              color: ConstantColors_ProdDetail
                                                  .description,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Buttons
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: mediaWidth * 0.85,
                      color: ConstantColors_ProdDetail.bottomSheet,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomMainButton(
                            text: "Add To Cart",
                            backgroundColor: Colors.transparent,
                            textColor: GlobalColors.primaryBackground,
                            width: mediaWidth * 0.4,
                            borderColor: GlobalColors.primaryBackground,
                            onPressed: () {
                              setState(() {});
                              addToCart(
                                  shopIndex: Selection.shopIndex,
                                  filterIndex: Selection.filterIndex,
                                  productIndex: Selection.productIndex);
                              // showing Message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item added to cart...'),
                                  duration: Duration(
                                      seconds:
                                          1), // How long the SnackBar will be displayed
                                ),
                              );
                            },
                          ),
                          CustomMainButton(
                            text: "Buy Now",
                            backgroundColor: GlobalColors.primaryBackground,
                            textColor: GlobalColors.primaryHeading,
                            width: mediaWidth * 0.4,
                            onPressed: () {
                              setState(() {});
                              addToCart(
                                  shopIndex: Selection.shopIndex,
                                  filterIndex: Selection.filterIndex,
                                  productIndex: Selection.productIndex);
                              // Redirecting To Cart Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
