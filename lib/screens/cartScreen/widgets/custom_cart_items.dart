import 'package:flutter/material.dart';

import '../../../constants/global_constants.dart';
import '../../../functions.dart';
import '../constants/cart_constants.dart';

class CustomCartItem extends StatefulWidget {
  final String name;
  final num price;
  final String imgPath;
  final num quantity;
  const CustomCartItem(
      {super.key,
      required this.name,
      required this.price,
      required this.imgPath,
      required this.quantity});

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  @override
  Widget build(BuildContext context) {
    // Media Queries
    // var mediaWidth = MediaQuery.of(context).size.width;
    // var mediaHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      // width: 50,
      // height: 40,

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
          margin: EdgeInsets.only(right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "${widget.imgPath}",
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ),

        // Product Name
        title: Text(
          "${toSentenceCase(widget.name)}",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),

        // Product Cost
        subtitle: Text(
          "\$${widget.price}",
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
                backgroundColor: GlobalColors.productCardBackground,
                foregroundColor: GlobalColors.secondaryBackground,
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
                "${widget.quantity}",
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
  }
}
