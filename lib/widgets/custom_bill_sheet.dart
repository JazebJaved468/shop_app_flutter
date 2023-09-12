import 'package:flutter/material.dart';

import '../constants/global_constants.dart';
import '../functions.dart';
import '../screens/cartScreen/constants/cart_constants.dart';
import 'custom_main_button.dart';

class CustomBill extends StatefulWidget {
  // final num subtotalAmount;
  // final num deliveryAmount;
  final String buttonText;
  final Color? buttonBackgroundColor;
  final void Function()? onPressed;

  /// final vars dene hain
  const CustomBill(
      {super.key,
      required this.buttonText,
      this.onPressed,
      this.buttonBackgroundColor});

  @override
  State<CustomBill> createState() => _CustomBillState();
}

class _CustomBillState extends State<CustomBill> {
  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;

    // getting subtotal and delivery amount
    num subtotalAmount = getSubtotal();
    num deliveryAmount = getDeliveryAmount();
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: ConstantColors_Cart.bottomSheet,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      width: mediaWidth * 1,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 38, right: 38, top: 18, bottom: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ConstantColors_Cart.amountLabel,
                      ),
                    ),
                    Text(
                      "\$${(subtotalAmount).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.secondaryBackground,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ConstantColors_Cart.amountLabel,
                      ),
                    ),
                    Text(
                      "\$${(deliveryAmount).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.secondaryBackground,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ConstantColors_Cart.amountLabel,
                      ),
                    ),
                    Text(
                      "\$${(subtotalAmount + deliveryAmount).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: GlobalColors.secondaryBackground,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Checkout Button
          CustomMainButton(
            text: widget.buttonText,
            backgroundColor:
                widget.buttonBackgroundColor ?? GlobalColors.primaryBackground,
            textColor: GlobalColors.primaryHeading,
            width: mediaWidth * 1,
            onPressed: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
