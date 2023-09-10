import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/screens/addressScreen/constants/address_screen_constants.dart';
import 'package:shopping_app/widgets/custom_back_button.dart';
import 'package:shopping_app/widgets/custom_main_button.dart';

import '../PaymentScreen/payment_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //Appbar
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          "Shopping Cart (${CartData.data.length})",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //Body
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Container(
              // margin: EdgeInsets.only(top: 30),
              child: Text(
                "Delivery Address",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            //Addresses
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              margin: EdgeInsets.only(
                top: 20,
                bottom: 30,
              ),
              // color: Colors.red,
              height:
                  PersonalInfo.addresses.length * (50 + 24) > mediaHeight * 0.6
                      ? mediaHeight * 0.55
                      : PersonalInfo.addresses.length * (96 + 24),
              child: ListView.builder(
                  itemCount: PersonalInfo.addresses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Selection.addressIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 17,
                          left: 20,
                          right: 20,
                          bottom: 22,
                        ),
                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                          border: Border.all(
                            color: Selection.addressIndex == index
                                ? GlobalColors.yellow
                                : ConstantColors_addressScreen.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.only(top: 14, bottom: 10),
                        width: double.infinity,
                        height: 96,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // color: Colors.red,
                                width: mediaWidth * 0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${PersonalInfo.addresses[index]['place']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalColors.secondaryBackground,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "${PersonalInfo.addresses[index]['address']}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.red,
                                width: mediaWidth * 0.1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: Selection.addressIndex == index,
                                      child: SvgPicture.asset(
                                        'assets/icons/done.svg',
                                        width: 18,
                                        // height: 18,
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            // backgroundColor: Colors.red,
                                            padding: EdgeInsets.all(0)),
                                        onPressed: () {},
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(
                                            color: Color(0xff2A4BA0),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    );
                  }),
            ),

            //Add new address Button
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: GlobalColors.yellow,
                      shape: RoundedRectangleBorder(),
                      title: const Text(
                        "Implementation of this feature will be done later",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  border: RDottedLineBorder.all(
                    color: ConstantColors_addressScreen.borderColor,
                    dottedLength: 10,
                    dottedSpace: 12,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                          border: Border.all(
                            color: GlobalColors.yellow,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.add,
                          color: GlobalColors.yellow,
                          size: 12,
                        ),
                      ),
                      Text(
                        "Add New Address",
                        style: TextStyle(
                          color: GlobalColors.secondaryBackground,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Using Expnaded to push 'Add card' button to the bottom
            Expanded(
              child: Container(),
            ),

            //Add Card Button
            CustomMainButton(
              text: "Add Card",
              backgroundColor: GlobalColors.primaryBackground,
              textColor: GlobalColors.primaryHeading,
              width: double.infinity,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
