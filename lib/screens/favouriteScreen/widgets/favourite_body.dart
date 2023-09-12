import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/screens/productDetailScreen/prod_detail_screen.dart';
import 'package:shopping_app/widgets/custom_rating_stars.dart';

import '../../../constants/global_constants.dart';
import '../../../functions/functions.dart';
import '../../../widgets/custom_cart_icon.dart';
import '../../../widgets/custom_search_icon.dart';
import '../../homeScreen/constants/home_constants.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // greetings
        Container(
          height: 80,
          padding: const EdgeInsets.only(left: 14, right: 5),
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

        // Your Favourites title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14, right: 25, bottom: 20),
          margin: EdgeInsets.zero,
          color: GlobalColors.primaryBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your",
                style: TextStyle(
                  color: GlobalColors.primaryHeading,
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "Favourites",
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

        // show when Empty
        Visibility(
          visible: FavouriteData.data.isEmpty,
          child: Container(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 170),
            // color: Colors.yellow,
            child: Column(
              children: [
                //Empty Box Image
                SvgPicture.asset(
                  'assets/icons/emptyBox.svg',
                  color: const Color(0xff8891A5),
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  height: 15,
                ),

                // Message
                const Text(
                  "Your Favorite's List is empty. Start adding your favorite items now to easily access them later!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 100, 107, 121),
                  ),
                ),
              ],
            ),
          ),
        ),

        //List view
        Visibility(
          visible: FavouriteData.data.isNotEmpty,
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              // color: Colors.red,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: FavouriteData.data.length,
                itemBuilder: (context, index) {
                  // int shopIndex = FavouriteData.data[index]['shopIndex'];
                  // int filterIndex = FavouriteData.data[index]['filterIndex'];
                  // int productIndex = FavouriteData.data[index]['productIndex'];
                  return Container(
                    margin: const EdgeInsets.only(top: 24),
                    // color: Colors.black,
                    child: InkWell(
                      onTap: () async {
                        Selection.shopIndex =
                            FavouriteData.data[index]['shopIndex'];
                        Selection.filterIndex =
                            FavouriteData.data[index]['filterIndex'];
                        Selection.productIndex =
                            FavouriteData.data[index]['productIndex'];
                        String? refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProdDetailScreen(
                                  itemIndex: Selection.productIndex)),
                        );

                        if (refresh == 'r' || refresh == null) {
                          setState(() {});
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage(
                                FavouriteData.data[index]['imgPath'],
                              ),
                              width: mediaWidth * 0.35,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Product Details
                          Container(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16, left: 20, right: 10),
                            // color: Colors.yellowAccent,
                            width: mediaWidth * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //name
                                Text(
                                  "${toSentenceCase(FavouriteData.data[index]['name'])}",
                                  style: TextStyle(
                                    color: GlobalColors.secondaryBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                //stars
                                CustomRatingStars(
                                  rating: FavouriteData.data[index]['rating'],
                                ),

                                //Gap
                                // const SizedBox(
                                //   height: 38,
                                // ),
                                //

                                // Heart Icon Button
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      FavouriteData.data
                                          .remove(FavouriteData.data[index]);
                                      // showing Message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Item removed from favourites.'),
                                          duration: Duration(
                                              seconds:
                                                  1), // How long the SnackBar will be displayed
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 26,
                                    ),
                                  ),
                                ),
                                //Price
                                Text(
                                  "\$${FavouriteData.data[index]['price'].toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: GlobalColors.primaryBackground,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),

                                //Shop Name
                                Text(
                                  "From: ${toSentenceCase(FavouriteData.data[index]['shop'])}",
                                  style: const TextStyle(
                                      color: Color(0xff8891A5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),

                          // // Heart Icon Button
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.favorite,
                          //     color: Colors.red,
                          //     size: 26,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
