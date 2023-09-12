import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';

import '../../widgets/custom_back_button.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //title
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          "Track Order",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //body
      body: Column(
        children: [
          // divider
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 15),
            width: mediaWidth * 1,
            height: 1,
            color: Color.fromARGB(255, 239, 241, 242),
          ),

          //map
          Container(
            width: mediaWidth * 0.84,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // color: Colors.red,
            ),
            margin: EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 15),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Image(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/map.PNG"),
                  width: mediaWidth * 1,
                  height: mediaHeight * 0.5,
                ),

                Container(
                  height: mediaHeight * 0.52,
                  // color: Colors.green,
                  width: mediaWidth * 1,
                ),

                //driver
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: mediaWidth * 0.84,
                    // height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F9FB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      //profile pic
                      leading: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(64, 0, 0, 0),
                                blurRadius: 25,
                                spreadRadius: 2,
                                blurStyle: BlurStyle.normal),
                          ],
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color(0xffFFFFFF),
                            width: 4,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 22,
                        ),
                      ),

                      // label
                      title: Text(
                        "Delivery Man",
                        style: TextStyle(
                            color: Color.fromARGB(255, 130, 132, 135),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),

                      //name
                      subtitle: Text(
                        "Rakibul Hassan",
                        style: TextStyle(
                          color: GlobalColors.secondaryBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      //chat
                      trailing: Container(
                        width: 45,
                        height: 45,
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: GlobalColors.primaryBackground,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/chat.svg",
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.zero,
                //   height: mediaHeight * 0.5,
                //   color: Colors.red,
                //   width: mediaWidth * 1,
                //   child: Image(
                //     alignment: Alignment.topCenter,
                //     image: AssetImage("assets/images/map.PNG"),
                //     width: mediaWidth * 1,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
