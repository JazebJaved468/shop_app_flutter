import 'package:flutter/material.dart';

import 'package:shopping_app/screens/cartScreen/widgets/custom_cart_items.dart';


import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_bill_sheet.dart';
import 'constants/cart_constants.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({super.key});

  @override
  State<FullCartScreen> createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const  CustomBackButton(),
        title: Text(
          "Shopping Cart (${CartData.data.length})",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          // cart items list
          Container(
            width: mediaWidth * 1,
            padding:  const EdgeInsets.only(right: 20, left: 20),
            margin: const  EdgeInsets.only(bottom: 10),
            height: 470,
            // color: Colors.white,
            child: ListView.builder(
              padding:  const EdgeInsets.only(top: 15, bottom: 0),
              shrinkWrap: true,
              itemCount: // cart items number sample
                  CartData.data.length,
              itemBuilder: (context, index) {
                return CustomCartItem(
                  name: CartData.data[index]['name'],
                  price: CartData.data[index]['price'],
                  imgPath: CartData.data[index]['imgPath'],
                  quantity: CartData.data[index]['quantity'],
                );
              },
            ),
          ),

          //edit show more buttons
          Container(
            width: mediaWidth * 1,
            height: 30,
            // color: Colors.yellow,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.zero,
            margin:  const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {},
              child:  const Text(
                "Edit",
                style: TextStyle(
                  color: Color(0xff2A4BA0),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                // color: Colors.red,
                ),
          ),

          // Bottom Sheet (Bill)
          const CustomBill(
              subtotalAmount: 35.96,
              deliveryAmount: 2.00,
              buttonText: "Proceed To checkout")
        ],
      ),
    );
  }
}
