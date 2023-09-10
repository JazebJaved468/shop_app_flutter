import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/PaymentScreen/constants/payment_screen_constants.dart';
import 'package:shopping_app/widgets/custom_bill_sheet.dart';

import '../../data/data.dart';
import '../../widgets/custom_back_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //removed overflow erro when keyboard launches for input fields
      //Appbar
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          "Add Card",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      //Body
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 36, left: 22, right: 22),
            width: mediaWidth * 1,
            height: mediaHeight * 0.5,
            // color: Colors.red,
            child: Column(
              children: [
                // Name
                Container(
                  margin: EdgeInsets.only(
                    bottom: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD HOLDER NAME",
                        style: ConstantStyles_paymentScreen.label,
                      ),
                      TextField(
                        cursorColor: GlobalColors.secondaryBackground,
                        cursorRadius: Radius.circular(30),

                        cursorOpacityAnimates: true,
                        // cursorHeight: 18,
                        keyboardType: TextInputType.name,
                        autofocus: false,
                        style: TextStyle(
                          color: GlobalColors.secondaryBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: GlobalColors
                                  .secondaryBackground, // Change this to your desired color
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(
                                  0xffE9EAF4), // Change this to your desired color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Card Number
                Container(
                  margin: EdgeInsets.only(
                    bottom: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD NUMBER",
                        style: ConstantStyles_paymentScreen.label,
                      ),
                      TextField(
                        maxLength: 16,
                        cursorColor: GlobalColors.secondaryBackground,
                        cursorRadius: Radius.circular(30),

                        cursorOpacityAnimates: true,
                        // cursorHeight: 18,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        style: TextStyle(
                          color: GlobalColors.secondaryBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),

                        decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: GlobalColors
                                  .secondaryBackground, // Change this to your desired color
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(
                                  0xffE9EAF4), // Change this to your desired color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Date and CVC
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expiry Date
                    Container(
                      width: mediaWidth * 0.38,
                      margin: EdgeInsets.only(
                        bottom: 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EXP DATE",
                            style: ConstantStyles_paymentScreen.label,
                          ),
                          TextField(
                            maxLength: 5,
                            cursorColor: GlobalColors.secondaryBackground,
                            cursorRadius: Radius.circular(30),

                            cursorOpacityAnimates: true,
                            // cursorHeight: 18,
                            keyboardType: TextInputType.datetime,

                            autofocus: false,
                            style: TextStyle(
                              color: GlobalColors.secondaryBackground,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),

                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              hintStyle: TextStyle(
                                color: ConstantColors_paymentScreen.label,
                                fontWeight: FontWeight.w300,
                              ),
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: GlobalColors
                                      .secondaryBackground, // Change this to your desired color
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(
                                      0xffE9EAF4), // Change this to your desired color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // CVC
                    Container(
                      width: mediaWidth * 0.38,
                      margin: EdgeInsets.only(
                        bottom: 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVC",
                            style: ConstantStyles_paymentScreen.label,
                          ),
                          TextField(
                            maxLength: 4,

                            cursorColor: GlobalColors.secondaryBackground,
                            cursorRadius: Radius.circular(30),

                            cursorOpacityAnimates: true,
                            // cursorHeight: 18,
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            style: TextStyle(
                              color: GlobalColors.secondaryBackground,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),

                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: GlobalColors
                                      .secondaryBackground, // Change this to your desired color
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(
                                      0xffE9EAF4), // Change this to your desired color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          CustomBill(
            buttonText: "Make Payment",
          ),
        ],
      ),
    );
  }
}
