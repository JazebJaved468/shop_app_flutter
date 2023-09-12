// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/screens/homeScreen/home.dart';
import 'package:shopping_app/widgets/custom_main_button.dart';

import '../../constants/global_constants.dart';
// import '../../widgets/custom_back_button.dart';
import '../trackOrderScreen/track_order_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  updateSelectedOrderFilterIndex(index) {
    Selection.orderFilter = index;
  }

  updateTempListData() {
    Selection.tempOrderFilterData =
        PersonalInfo.orders[Selection.orderFilter]['order'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Media Queries
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //Back Button
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: const Color(0xffF8F9FB),
            radius: 8,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 14,
              ),
              onPressed: () {
                // Redirecting To Home Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ),
        ),

        // title
        title: const Text(
          "Orders",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //body
      body: Column(
        children: [
          //Filter
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Current
                GestureDetector(
                  onTap: () {
                    updateSelectedOrderFilterIndex(0);
                    updateTempListData();
                  },
                  child: Container(
                    width: mediaWidth * 0.44,
                    height: mediaHeight * 0.055,
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Selection.orderFilter == 0
                            ? const Color(0xffF9B023)
                            : const Color(0xff616A7D),
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: Selection.orderFilter == 0
                          ? const Color(0xffF9B023)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        // type,
                        "Current",
                        style: TextStyle(
                            fontSize: 16,
                            color: Selection.orderFilter == 0
                                ? GlobalColors.primaryHeading
                                : GlobalColors.secondaryBackground),
                      ),
                    ),
                  ),
                ),

                //Gap
                const SizedBox(
                  width: 8,
                ),

                // Past
                GestureDetector(
                  onTap: () {
                    updateSelectedOrderFilterIndex(1);
                    updateTempListData();
                  },
                  child: Container(
                    width: mediaWidth * 0.44,
                    height: mediaHeight * 0.055,
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Selection.orderFilter == 1
                              ? const Color(0xffF9B023)
                              : const Color(0xff616A7D)),
                      borderRadius: BorderRadius.circular(50),
                      color: Selection.orderFilter == 1
                          ? const Color(0xffF9B023)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        // type,
                        "Past",
                        style: TextStyle(
                          fontSize: 16,
                          color: Selection.orderFilter == 1
                              ? GlobalColors.primaryHeading
                              : GlobalColors.secondaryBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Dynamic filter
          // Container(
          //   height: 70,
          //   // color: Colors.red,
          //   padding: EdgeInsets.symmetric(vertical: 15),
          //   child: ListView.builder(
          //     itemCount: PersonalInfo.orders.length,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Wrap(children: [
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             updateSelectedOrderFilterIndex(index);
          //             updateTempListData();
          //           },
          //           child: Container(
          //             width: mediaWidth * 0.45,
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 7, horizontal: 15),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                   color: index == Selection.orderFilter
          //                       ? const Color(0xffF9B023)
          //                       : const Color(0xff616A7D)),
          //               borderRadius: BorderRadius.circular(50),
          //               color: index == Selection.orderFilter
          //                   ? const Color(0xffF9B023)
          //                   : Colors.transparent,
          //             ),
          //             child: Center(
          //               child: Text(
          //                 // type,
          //                 "${PersonalInfo.orders[index]['type']}",
          //                 style: TextStyle(
          //                     fontSize: 16,
          //                     color: index == Selection.orderFilter
          //                         ? GlobalColors.primaryHeading
          //                         : GlobalColors.secondaryBackground),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ]);
          //       // CustomFilterOption(
          //       //   index: index,
          //       //   selectedFilterIndex: Selection.filterIndex,
          //       //   // ConstantTexts_ShopScreen.selectedFilterIndex
          //       // );
          //     },
          //   ),
          // ),

          // show when Empty
          Visibility(
            visible:
                PersonalInfo.orders[Selection.orderFilter]['orders'].isEmpty,
            child: Container(
              padding:
                  EdgeInsets.only(left: 60, right: 60, top: mediaHeight * 0.24),
              // color: Colors.yellow,
              child: Column(
                children: [
                  //Empty Box Image
                  SvgPicture.asset(
                    'assets/icons/emptyBox.svg',
                    // ignore: deprecated_member_use
                    color: const Color(0xff8891A5),
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Message
                  Text(
                    Selection.orderFilter == 0
                        ? "Your Current Orders list is empty. Place an order now to see it here!"
                        : "Your Past Orders history is empty. Start ordering now to track your past purchases!",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 100, 107, 121),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Orders List
          Visibility(
            visible:
                PersonalInfo.orders[Selection.orderFilter]['orders'].isNotEmpty,
            child: Expanded(
              child: ListView.builder(
                itemCount:
                    PersonalInfo.orders[Selection.orderFilter]['orders'].length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      bottom: 28,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffE9EAF4),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: mediaWidth * 0.4,
                          // color: Colors.green,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                // color: Colors.green,
                                height: 180,
                              ),
                              const Image(
                                image: AssetImage("assets/images/truck.png"),
                                height: 150,
                                colorBlendMode: BlendMode.difference,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                color:
                                                    Color.fromARGB(68, 0, 0, 0),
                                                blurRadius: 20,
                                                spreadRadius: 3,
                                                blurStyle: BlurStyle.normal),
                                          ],
                                          color: const Color(0xffEDEDED),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                            color: const Color(0xffFFFFFF),
                                            width: 4,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Wrap(
                                        children: [
                                          Text(
                                            "Meet our rider, ",
                                            style: TextStyle(
                                              color: Color(0xff8891A5),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "Rakib",
                                            style: TextStyle(
                                              color: Color(0xff616A7D),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          // color: Colors.yellow,
                          width: mediaWidth * 0.35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Wrap(
                                  children: [
                                    const Text(
                                      "ID: ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff616A7D),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "#${PersonalInfo.orders[Selection.orderFilter]['orders'][index]['id']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalColors.secondaryBackground,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Your Order ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: GlobalColors.secondaryBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "is on the way",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: GlobalColors.secondaryBackground,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomMainButton(
                                text: 'Track Order',
                                backgroundColor: GlobalColors.primaryBackground,
                                textColor: GlobalColors.primaryHeading,
                                width: mediaWidth * 0.27,
                                height: 54,
                                onPressed: () {
                                  Selection.orderIndex = index;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TrackOrderScreen()),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
