import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/screens/productDetailScreen/constants/prod_detail_screen_constants.dart';

import '../../constants/global_constants.dart';
import '../../functions.dart';
import '../../widgets/custom_appbar_actions.dart';
import '../../widgets/custom_back_button.dart';
import '../shopScreen/constants/shop_screen_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdDetailScreen extends StatefulWidget {
  final int? itemIndex;
  const ProdDetailScreen({super.key, required this.itemIndex});

  @override
  State<ProdDetailScreen> createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  //controller
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  //rating sample
  num rating = 4.5;

  // images sample
  List images = [
    'assets/images/discount1.jpg',
    'assets/images/discount2.jpg',
    'assets/images/discount3.jpg',
  ];

  //favourite
  bool isFavourite = false;

  //getting filterindex and itemdatalist
  List itemData = ConstantTexts_ShopScreen.itemData;
  int typeIndex = ConstantTexts_ShopScreen.selectedFilterIndex;
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
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
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
            ));

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "${toSentenceCase(itemData[typeIndex]['items'][widget.itemIndex]['name'])}",
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
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 225),
                  borderRadius: BorderRadius.only(
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
                              child: const Text(
                                "Thin Choise Top Orange",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                            ),
                            // favourite button
                            IconButton(
                              onPressed: () {
                                isFavourite = !(isFavourite);

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
                                      "\$34.70",
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
                                        "\$22.04 OFF",
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
                                "Reg: \$56.70 USD",
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
                              SizedBox(
                                height: 20,
                                width: 100,
                                child: ListView.separated(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star_rate_rounded,
                                      size: 15,
                                      color: index + 1 <= rating
                                          ? GlobalColors.yellow
                                          : GlobalColors.secondaryBackground,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 3,
                                    );
                                  },
                                ),
                              ),

                              // No. of reviews
                              Text(
                                "110 Reviews",
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
                          margin: EdgeInsets.only(bottom: 14),
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
                              children: const [
                                Text(
                                  "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.",
                                  style: TextStyle(
                                      color: Color(0xff8891A5), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Nutritional Facts
                        Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(bottom: 14),

                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              // iconColor: ConstantColors_ProdDetail.description,
                              collapsedIconColor:
                                  ConstantColors_ProdDetail.description,

                              expandedAlignment: Alignment.centerLeft,
                              tilePadding: EdgeInsets.zero,
                              title: Text(
                                "Nutritional Facts",
                                style: TextStyle(),
                              ),
                              children: [
                                Text(
                                  "calories: 41,\ncarbohydrates: 10,\nfat: 0.2,\nprotein: 1,\nfiber: 2.8",
                                  style: TextStyle(
                                      color: Color(0xff8891A5), fontSize: 16),
                                ),
                              ],
                              initiallyExpanded: false,
                            ),
                          ),
                        ),

                        // Reviews
                        Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(bottom: 14),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              // iconColor: ConstantColors_ProdDetail.description,
                              collapsedIconColor:
                                  ConstantColors_ProdDetail.description,

                              expandedAlignment: Alignment.centerLeft,
                              tilePadding: EdgeInsets.zero,
                              title: Text(
                                "Reviews",
                                style: TextStyle(),
                              ),
                              children: [
                                Container(
                                  color: Color.fromARGB(255, 231, 231, 236),
                                  height: 200,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 7,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.only(bottom: 10),
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
                                            "Comment",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          subtitle: Text(
                                            "By Person $index",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          trailing: Text(
                                            "09/05/23",
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
                              initiallyExpanded: false,
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
                      color: Color.fromARGB(255, 224, 224, 225),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: mediaWidth * 0.4,
                            height: 60,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: GlobalColors.primaryBackground,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(),
                              ),
                              onPressed: () {},
                              child: Text("Add To Cart"),
                            ),
                          ),
                          Container(
                            width: mediaWidth * 0.4,
                            height: 60,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: GlobalColors.primaryBackground,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: GlobalColors.primaryBackground,
                                shape: RoundedRectangleBorder(),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  color: GlobalColors.primaryHeading,
                                ),
                              ),
                            ),
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
