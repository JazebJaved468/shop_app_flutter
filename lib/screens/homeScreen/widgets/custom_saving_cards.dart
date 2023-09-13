import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/global_constants.dart';
import '../constants/home_constants.dart';

class CustomSavingCards extends StatelessWidget {
  const CustomSavingCards({super.key});

  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Container(
      // margin: EdgeInsets.only(top: 25),
      height: 160,
      // color: Colors.red,
      width: mediaWidth * 1,
      child: Stack(
        children: [
          // Background Widgets
          Positioned(
            top: 2,
            left: 10,
            child: SvgPicture.asset('assets/curves/curve1.svg'),
          ),
          Positioned(
            bottom: 0,
            left: mediaWidth * 0.3,
            child: SvgPicture.asset('assets/curves/curve2.svg'),
          ),
          Positioned(
            bottom: 14,
            left: mediaWidth * 0.47,
            child: SvgPicture.asset('assets/curves/curve3.svg'),
          ),
          Positioned(
            right: 0,
            top: 90,
            child: SvgPicture.asset('assets/curves/curve4.svg'),
          ),

          // Foreground Widgets
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 130,
              // color: Colors.green,
              width: mediaWidth * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //1st Card
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 36),
                    // margin: EdgeInsets.only(left: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffFFC83A),
                    ),
                    width: mediaWidth * 0.43,
                    child: Container(
                      // padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "346 ",
                                style: TextStyle(
                                    color: GlobalColors.secondaryBackground,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "USD",
                                style: TextStyle(
                                  color: GlobalColors.secondaryBackground,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Your total savings",
                            style: TextStyle(
                                color: GlobalColors.secondaryBackground,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //2nd Card
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 36),
                    // margin: EdgeInsets.only(left: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ConstantColors_Home.cardSecondaryBackground,
                    ),
                    width: mediaWidth * 0.43,
                    child: Container(
                      // padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "215 ",
                                style: TextStyle(
                                    color: GlobalColors.secondaryBackground,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "HRS",
                                style: TextStyle(
                                  color: GlobalColors.secondaryBackground,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Your time saved",
                            style: TextStyle(
                                color: GlobalColors.secondaryBackground,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
