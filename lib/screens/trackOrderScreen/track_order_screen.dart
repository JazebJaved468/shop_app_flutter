import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/functions/functions.dart';
import 'package:shopping_app/widgets/remaining_work_dialogue.dart';

import '../../widgets/custom_back_button.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  //Setting label margins
  double sheetLabelsBottomMargin = 8;
  double sheetLabelsTopMargin = 15;

  // storing order Items Path
  var orderItems = PersonalInfo.orders[Selection.orderFilter]['orders']
      [Selection.orderIndex]['items'];

  // Getting Order Subtotal
  num orderSubtotalCharges = getOrderSubtotal();

  // Getting Order Delivery Charges
  num orderDeliveryCharges = getOrderDeliveryAmount();
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //title
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(
          "Track Order",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //body
      body: Stack(
        children: [
          //background Widgets (w.r.t Bottom Sheet)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // divider
              Container(
                margin: const EdgeInsets.only(
                    left: 24, right: 24, top: 0, bottom: 15),
                width: mediaWidth * 1,
                height: 1,
                color: const Color.fromARGB(255, 239, 241, 242),
              ),

              //map
              Center(
                child: Container(
                  width: mediaWidth * 0.84,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.red,
                  ),
                  margin: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 24),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return RemainingWorkDialogue(
                                message: "No map integrated at backend",
                              );
                            },
                          );
                        },
                        child: Image(
                          alignment: Alignment.topCenter,
                          image: const AssetImage("assets/images/map.PNG"),
                          width: mediaWidth * 1,
                          height: mediaHeight * 0.5,
                        ),
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
                            color: const Color(0xffF8F9FB),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            //profile pic
                            leading: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(64, 0, 0, 0),
                                      blurRadius: 25,
                                      spreadRadius: 2,
                                      blurStyle: BlurStyle.normal),
                                ],
                                color: const Color(0xffEDEDED),
                                borderRadius: BorderRadius.circular(50),
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

                            // label
                            title: const Text(
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
                            trailing: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return RemainingWorkDialogue(
                                      message:
                                          "Chat Feature Unavailable Right Now",
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                padding: const EdgeInsets.all(11),
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
                      ),
                    ],
                  ),
                ),
              ),

              // time
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 0),
                child: const ListTile(
                  leading: Icon(
                    Icons.access_time,
                    size: 22,
                    color: Color(0xff8891A5),
                  ),

                  // label
                  title: Text(
                    "Delivery In",
                    style: TextStyle(
                        color: Color.fromARGB(255, 130, 132, 135),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),

                  //duration
                  subtitle: Text(
                    "25 Min",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              // address
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 15),
                child: const ListTile(
                  leading: Icon(
                    Icons.location_on_outlined,
                    size: 22,
                    color: Color(0xff8891A5),
                  ),

                  // label
                  title: Text(
                    "Delivery Address",
                    style: TextStyle(
                        color: Color.fromARGB(255, 130, 132, 135),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),

                  //location
                  subtitle: Text(
                    "37 New line, Sunamganj",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //draggable sheet
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 30, right: 30, bottom: 10),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                    color: GlobalColors.bottomSheet),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // controller: scrollController,
                    children: [
                      //Handle Bar
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 26),
                          decoration: BoxDecoration(
                              color: const Color(0xffB2BBCE),
                              borderRadius: BorderRadius.circular(50)),
                          width: 75,
                          height: 6,
                        ),
                      ),

                      //order details line
                      Container(
                        margin:
                            EdgeInsets.only(bottom: sheetLabelsBottomMargin),
                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            const Text(
                              "Order Details ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "(ID: #${PersonalInfo.orders[Selection.orderFilter]['orders'][Selection.orderIndex]['id']})",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      // Customer Name
                      Container(
                        margin: EdgeInsets.only(
                          bottom: sheetLabelsBottomMargin,
                          top: sheetLabelsTopMargin,
                        ),
                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            const Text(
                              "Customer Name: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Muhammad Jazeb Javed",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      // Customer Number
                      Container(
                        margin:
                            EdgeInsets.only(bottom: sheetLabelsBottomMargin),
                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            const Text(
                              "Customer Contact: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "0307 0075922",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      // Customer Address
                      Container(
                        margin:
                            EdgeInsets.only(bottom: sheetLabelsBottomMargin),

                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            const Text(
                              "Customer Address: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: mediaWidth * 0.4,
                              child: Text(
                                "Medical road, Halal lab, Sunamganj",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // No. Of items
                      Container(
                        margin: EdgeInsets.only(
                          bottom: sheetLabelsBottomMargin,
                          top: sheetLabelsTopMargin,
                        ),

                        // color: Colors.yellow,
                        child: Row(
                          children: [
                            const Text(
                              "No. Of items: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: mediaWidth * 0.4,
                              child: Text(
                                "${PersonalInfo.orders[Selection.orderFilter]['orders'][Selection.orderIndex]['items'].length}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // SubTotal
                      Container(
                        margin: EdgeInsets.only(
                          bottom: sheetLabelsBottomMargin,
                          top: sheetLabelsTopMargin,
                        ),

                        // color: Colors.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sub-Total: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: mediaWidth * 0.4,
                              child: Text(
                                "${orderSubtotalCharges.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Delivery Charges
                      Container(
                        margin:
                            EdgeInsets.only(bottom: sheetLabelsBottomMargin),

                        // color: Colors.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Delivery Charges: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: mediaWidth * 0.4,
                              child: Text(
                                "${orderDeliveryCharges.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Total
                      Container(
                        margin:
                            EdgeInsets.only(bottom: sheetLabelsBottomMargin),

                        // color: Colors.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: mediaWidth * 0.4,
                              child: Text(
                                "${(orderSubtotalCharges + orderDeliveryCharges).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Items
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: sheetLabelsBottomMargin,
                            top: 40,
                          ),
                          child: Text(
                            "ITEM(S)",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //     color: const Color(0xffB2BBCE),
                          //     borderRadius: BorderRadius.circular(50)),
                          // width: 75,
                          // height: 6,
                        ),
                      ),

                      // items table
                      Container(
                        height: orderItems.length * (20.0 + 8 + 5),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 233, 233),
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(top: 5),
                        child: ListView.builder(
                          itemCount: orderItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                // color: Colors.red,
                              ),
                              height: 20,
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 3,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mediaWidth * 0.45,
                                    child: Text(
                                      "${toSentenceCase(orderItems[index]['name'])}",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Text("x ${orderItems[index]['quantity']}"),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
