import 'package:flutter/material.dart';

import '../../constants/global_constants.dart';
import '../../data/data.dart';
import '../../functions.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_bill_sheet.dart';
import '../addressScreen/address_screen.dart';
import 'constants/cart_constants.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({super.key});

  @override
  State<FullCartScreen> createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  //Setting Variables
  int noOfItems = CartData.data.length;
  int val = 0;

  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "Shopping Cart (${noOfItems})",
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
            padding: const EdgeInsets.only(right: 20, left: 20),
            margin: const EdgeInsets.only(bottom: 10),
            height: 470,
            // color: Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15, bottom: 0),
              shrinkWrap: true,
              itemCount: // cart items number sample
                  CartData.data.length,
              itemBuilder: (context, cartItemIndex) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    border: Border(
                      bottom: BorderSide(
                        color: ConstantColors_Cart.cartItemBorder,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    // Product Image
                    leading: Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage(
                            CartData.data[cartItemIndex]['imgPath'],
                          ),
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Product Name
                    title: Text(
                      "${toSentenceCase(CartData.data[cartItemIndex]['name'])}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),

                    // Product Cost
                    subtitle: Text(
                      "\$${(CartData.data[cartItemIndex]['price']).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // Quantity Increase Decrease Buttons
                    trailing: Container(
                      // color: Colors.red,
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Subtract
                          CircleAvatar(
                            backgroundColor: GlobalColors.productCardBackground,
                            foregroundColor: GlobalColors.secondaryBackground,
                            radius: 18,
                            child: IconButton(
                              onPressed: () {
                                Selection.cartItemIndex = cartItemIndex;
                                var selectedItem =
                                    CartData.data[Selection.cartItemIndex];
                                selectedItem['quantity'] > 1
                                    ? selectedItem['quantity']--
                                    : selectedItem['quantity'];
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.horizontal_rule_rounded,
                                size: 14,
                                color: GlobalColors.secondaryBackground,
                              ),
                            ),
                          ),

                          //value
                          Text(
                            "${CartData.data[cartItemIndex]['quantity']}",
                            style: TextStyle(
                                color: GlobalColors.secondaryBackground,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),

                          // add
                          CircleAvatar(
                            backgroundColor: GlobalColors.productCardBackground,
                            foregroundColor: GlobalColors.secondaryBackground,
                            radius: 18,
                            child: IconButton(
                              onPressed: () {
                                Selection.cartItemIndex = cartItemIndex;
                                var selectedItem =
                                    CartData.data[Selection.cartItemIndex];
                                selectedItem['quantity']++;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add,
                                size: 14,
                                color: GlobalColors.secondaryBackground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                val++;
                setState(() {});
              },
              child: Text(
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
          CustomBill(
            buttonText: "Proceed To checkout",
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddressScreen()),
              );
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
