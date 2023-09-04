import 'package:flutter/material.dart';
import 'package:shopping_app/screens/shopScreen/constants/shop_screen_constants.dart';


import '../shop_items_screen.dart';

class CustomFilterOption extends StatefulWidget {
  final int index;
  final int selectedFilterIndex;
  final String shopName;
  final String type;
  const CustomFilterOption(
      {super.key,
      required this.type,
      required this.shopName,
      required this.index,
      required this.selectedFilterIndex});

  @override
  State<CustomFilterOption> createState() => _CustomFilterOptionState();
}

class _CustomFilterOptionState extends State<CustomFilterOption> {
  bool istapped = false;
  updateSelectedFilterIndex(index) {
    ConstantTexts_ShopScreen.selectedFilterIndex = index;
  }

  updateTempListData(String type) {
    print(type);
    ConstantTexts_ShopScreen.itemData.forEach((product) {
      if (product['type'] == type) {
        // print(product);
        // ConstantTexts_ShopScreen.tempData.clear();
        ConstantTexts_ShopScreen.tempData = product['items'];
        print(ConstantTexts_ShopScreen.tempData);
        setState(() {});
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ShopScreen(
                    shopName: widget.shopName,
                  )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          // ignore: avoid_print
          print("tapped");
          istapped = true;
          // ignore: avoid_print
          print("${widget.index} tapped");
          updateSelectedFilterIndex(widget.index);
          updateTempListData(widget.type);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(
                color: widget.index == widget.selectedFilterIndex
                    ? const Color(0xffF9B023)
                    : const Color(0xff616A7D)),
            borderRadius: BorderRadius.circular(50),
            color: widget.index == widget.selectedFilterIndex
                ? const Color(0xffF9B023)
                : Colors.transparent,
          ),
          child: Text(widget.type),
        ),
      ),
    ]);
  }
}
