import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/cartScreen/constants/cart_constants.dart';
import 'package:shopping_app/screens/cartScreen/full_cart_screen.dart';
import 'package:shopping_app/screens/cartScreen/widgets/custom_cart_items.dart';


import 'package:shopping_app/widgets/custom_bill_sheet.dart';




class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    // Media Queries
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          // Banner
          Container(
            width: double.infinity,
            height: mediaHeight * 0.3,
            color: ConstantColors_Cart.lightYellow,
            child: Stack(
              children: [
                //hashtag
                Positioned(
                  top: -120,
                  left: -25,
                  // height: 250,
                  child: Text(
                    "#",
                    style: TextStyle(
                      fontSize: 300,

                      color: ConstantColors_Cart.darkYellow,
                      fontWeight: FontWeight.w100,
                      // backgroundColor: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

                // slant sign
                Positioned(
                  right: 40,
                  top: 55,
                  child: SvgPicture.asset("assets/images/slant.svg"),
                ),

                // off
                Positioned(
                  bottom: -2,
                  right: 25,
                  child: Stack(
                    children: [
                      Text(
                        "25%",
                        style: TextStyle(
                          inherit: false,
                          color: GlobalColors.primaryHeading,
                          fontSize: 110,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 7,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 0,
                        child: Text(
                          "OFF!!",
                          style: TextStyle(
                            inherit: false,
                            color: GlobalColors.primaryHeading,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      //back button
                      CircleAvatar(
                        backgroundColor: const Color(0xffF8F9FB),
                        radius: 18,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 14,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Shopping Cart (${CartData.data.length})",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                //           AppBar(
                //   leading: CustomBackButton(),
                //   title: Text(
                //     "Shopping Cart (${CartData.data.length})",
                //     style: const TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

          //discount code
          Container(
            width: double.infinity,
            height: 50,
            color: ConstantColors_Cart.darkYellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Use code ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "#HalalFood ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "at Checkout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // cart items list
          Container(
            width: mediaWidth * 1,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 250,
            // color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 15, bottom: 0),
              shrinkWrap: true,
              itemCount: // cart items number sample
                  CartData.data.length > 3 ? 3 : 3,
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
            // width: mediaWidth * 1,
            height: 30,
            // color: Colors.yellow,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullCartScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "+ ${ // cart items number sample
                    CartData.data.length - 3} More",
                    style: TextStyle(
                      color: Color(0xff2A4BA0),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: Color(0xff2A4BA0),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                // color: Colors.red,
                ),
          ),

          // Bottom Sheet (Bill)
          CustomBill(
              subtotalAmount: 35.96,
              deliveryAmount: 2.00,
              buttonText: "Proceed To checkout")
        ],
      ),
    );
  }
}
