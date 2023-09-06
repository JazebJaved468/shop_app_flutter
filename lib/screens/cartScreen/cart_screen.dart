import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/cartScreen/constants/cart_constants.dart';
import 'package:shopping_app/widgets/custom_back_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // cart items number sample
  int cartItemsQuantity = 5;

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
                      // inherit: false,
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
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: Colors.red,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 200,
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItemsQuantity > 3 ? 3 : 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // width: 50,
                        // height: 40,

                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                                bottom: BorderSide(
                              color: ConstantColors_Cart.cartItemBorder,
                              width: 1,
                            ))),
                        child: ListTile(
                          // Product Image
                          leading: Container(
                            margin: EdgeInsets.only(right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/discount1.jpg",
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),

                          // Product Name
                          title: Text(
                            "Bananas",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Product Cost
                          subtitle: Text(
                            "\$7.90",
                            style: TextStyle(
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
                                  backgroundColor:
                                      GlobalColors.productCardBackground,
                                  foregroundColor:
                                      GlobalColors.secondaryBackground,
                                  radius: 18,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.horizontal_rule_rounded,
                                      size: 14,
                                      color: GlobalColors.secondaryBackground,
                                    ),
                                  ),
                                ),

                                //value
                                Text(
                                  "2",
                                  style: TextStyle(
                                      color: GlobalColors.secondaryBackground,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),

                                // add
                                CircleAvatar(
                                  backgroundColor:
                                      GlobalColors.productCardBackground,
                                  foregroundColor:
                                      GlobalColors.secondaryBackground,
                                  radius: 18,
                                  child: IconButton(
                                    onPressed: () {},
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
                )
              ],
            ),
          )
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
