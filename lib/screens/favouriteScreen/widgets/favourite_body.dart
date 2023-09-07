import 'package:flutter/material.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/widgets/custom_rating_stars.dart';

import '../../../constants/global_constants.dart';
import '../../../functions.dart';
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
    var mediaHeight = MediaQuery.of(context).size.height;
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

        //List view
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            color: Colors.red,
            child: ListView.builder(
              itemCount: FavouriteData.data.length,
              itemBuilder: (context, index) {
                int shopIndex = FavouriteData.data[index]['shopIndex'];
                int filterIndex = FavouriteData.data[index]['filterIndex'];
                int productIndex = FavouriteData.data[index]['productIndex'];
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: NetworkImage(
                            FavouriteData.data[index]['imgPath'],
                          ),
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Product Details
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              "${toSentenceCase(FavouriteData.data[index]['name'])}",
                              style: TextStyle(
                                  color: GlobalColors.secondaryBackground,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),

                            //stars
                            CustomRatingStars(
                 
                              rating : FavouriteData.data[index]['rating'],
                            ),
                            Text("data"),
                            Text("data"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
