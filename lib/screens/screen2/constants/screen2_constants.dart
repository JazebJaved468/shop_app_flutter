import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConstantColors_Screen2 {
  static Color appbarBackground = GlobalColors.primaryBackground;
  static Color dropDowndescription = Color.fromARGB(113, 208, 208, 208);
  static Color dropDownBackground = Color.fromARGB(152, 42, 75, 160);
  static Color seacrhBackground = Color(0xff153075);
  static Color cardPrimaryBackground = Color(0xffF9B023);
  static Color cardSecondaryBackground = Color(0xffE4DDCB);
}

class Dropdown {
  static var deliveryOptions = [
    "Green Way 3000, Sylhet",
    "Blue Way 5000, Karachi",
    "Yellow Way 1000, Mumbai",
  ];
  static String deliveryDefaultValue = "Green Way 3000, Sylhet";

  static var timeOptions = [
    "1 Hour",
    "2 Hour",
    "3 Hour",
  ];
  static String timeDefaultValue = "1 Hour";
}

class ConstantImagePaths_Screen2 {

}

class ConstantSVGPaths_Screen2 {
  static String appbarIconSVG = "assets/icons/bags.svg";
  static String searchIconSVG = "assets/icons/search.svg";
}

class ConstantTexts_Screen2 {
  static String greeting = "Hey, Halal";
  static String dropDownDeliveryLabel = "DELIVERY TO";
  static String dropDownTimeLabel = "WITHIN";
  static String searchHintText = 'Search Products or store';
    static List discountCardsData = [
    {
      'image': "assets/images/discount1.jpg",
      'discount': '50',
      'products': '03'
    },
    {
      'image': "assets/images/discount2.jpg",
      'discount': '30',
      'products': '02'
    },
    {
      'image': "assets/images/discount3.jpg",
      'discount': '10',
      'products': '01'
    },
  ];
}

class ConstantStyles_Screen2 {
  static TextStyle? appbarTitle = TextStyle(
      color: GlobalColors.primaryHeading,
      fontSize: 22,
      fontWeight: FontWeight.w600);

  static TextStyle? dropDownLabel = TextStyle(
      fontSize: 12, color: ConstantColors_Screen2.dropDowndescription);

  static InputDecoration searchInput = InputDecoration(
    filled: true,
    fillColor: ConstantColors_Screen2.seacrhBackground, // Dark background color
    hintText: ConstantTexts_Screen2.searchHintText,
    hintStyle: TextStyle(color: Colors.grey, fontSize: 14), // Hint text color
    prefixIcon: Container(
      width: 60,
      child: SvgPicture.asset(
        ConstantSVGPaths_Screen2.searchIconSVG,
        fit: BoxFit.scaleDown,
      ),
    ), // Search prefix icon
    contentPadding:
        EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0), // Input padding
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0), // Rounded borders
      borderSide: BorderSide.none, // No border
    ),
  );
}
