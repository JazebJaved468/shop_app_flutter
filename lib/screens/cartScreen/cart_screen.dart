import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/addressScreen/address_screen.dart';
import 'package:shopping_app/screens/cartScreen/constants/cart_constants.dart';
import 'package:shopping_app/screens/cartScreen/full_cart_screen.dart';

import 'package:shopping_app/widgets/custom_bill_sheet.dart';

import '../../data/data.dart';
import '../../functions.dart';
import '../productDetailScreen/prod_detail_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //Setting Variables
  int noOfItems = CartData.data.length;

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
            child: const Row(
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

          // show when Empty
          Visibility(
            visible: CartData.data.isEmpty,
            child: Container(
              padding: const EdgeInsets.only(left: 60, right: 60, top: 80),
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
                  const Text(
                    "Your Cart is empty. Browse our products and start adding items to fill it up!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 107, 121),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // cart items list
          Visibility(
            visible: CartData.data.isNotEmpty,
            child: Container(
              width: mediaWidth * 1,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 250,
              // color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                shrinkWrap: true,
                itemCount: // cart items number sample
                    noOfItems > 3 ? 3 : noOfItems,
                itemBuilder: (context, cartItemIndex) {
                  return InkWell(
                    onTap: () {
                      Selection.shopIndex =
                          CartData.data[cartItemIndex]['shopIndex'];
                      Selection.filterIndex =
                          CartData.data[cartItemIndex]['filterIndex'];
                      Selection.productIndex =
                          CartData.data[cartItemIndex]['productIndex'];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProdDetailScreen(
                                itemIndex: Selection.productIndex)),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
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
                                backgroundColor:
                                    GlobalColors.productCardBackground,
                                foregroundColor:
                                    GlobalColors.secondaryBackground,
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
                                backgroundColor:
                                    GlobalColors.productCardBackground,
                                foregroundColor:
                                    GlobalColors.secondaryBackground,
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
                    ),
                  );
                },
              ),
            ),
          ),

          //edit show more buttons
          Container(
            // width: mediaWidth * 1,
            height: 30,
            // color: Colors.yellow,
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: noOfItems > 3,
                  child: TextButton(
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
                      style: const TextStyle(
                        color: Color(0xff2A4BA0),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: CartData.data.isNotEmpty,
                  child: TextButton(
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
          ),
          Expanded(
            child: Container(
                // color: Colors.red,
                ),
          ),

          // Bottom Sheet (Bill)
          CustomBill(
            buttonText: "Proceed To checkout",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddressScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
