import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/cartScreen/constants/cart_constants.dart';
import 'package:shopping_app/screens/cartScreen/widgets/custom_cart_items.dart';
import 'package:shopping_app/widgets/custom_back_button.dart';
import 'package:shopping_app/widgets/custom_cart_icon.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // cart items number sample
  int cartItemsQuantity = 5;

  // cart items sample
  List<Map> cartItems = [
    {
      'name': "Bananas",
      'price': 7.90,
      'imgPath': 'assets/images/discount1.jpg',
      'quantity': 2,
    },
    {
      'name': "Apple",
      'price': 5.60,
      'imgPath': 'assets/images/discount2.jpg',
      'quantity': 2,
    },
    {
      'name': "Mango",
      'price': 3.80,
      'imgPath': 'assets/images/discount3.jpg',
      'quantity': 2,
    },
    {
      'name': "Graeps",
      'price': 7.90,
      'imgPath': 'assets/images/discount1.jpg',
      'quantity': 2,
    },
  ];

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
              itemCount: cartItemsQuantity > 3 ? 3 : 3,
              itemBuilder: (context, index) {
                return CustomCartItem(
                  name: cartItems[index]['name'],
                  price: cartItems[index]['price'],
                  imgPath: cartItems[index]['imgPath'],
                  quantity: cartItems[index]['quantity'],
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
                  onPressed: () {},
                  child: Text(
                    "+ ${cartItemsQuantity - 3} More",
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

          // Calculation
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
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
                  padding: const EdgeInsets.only(
                      left: 38, right: 38, top: 16, bottom: 35),
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
                            "\$35.96",
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
                            "\$2.00",
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
                            "\$38.98",
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
                Container(
                  width: mediaWidth * 1,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: GlobalColors.primaryBackground,
                      width: 1,
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: GlobalColors.primaryBackground,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Proceed To checkout",
                      style: TextStyle(
                        color: GlobalColors.primaryHeading,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// AppBar(
//         leading: CustomBackButton(),
//         title: Text(
//           "Shopping Cart (5)",
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
