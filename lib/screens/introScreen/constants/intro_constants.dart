import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';

class ConstantColors_Intro {
  static Color descriptionColor = Color(0xffB2BBCE);
  static Color buttonBackground = Color(0xffFAFBFD);
  static Color buttonText = Color(0xff1E222B);
  static Color sliderInactiveColor = Color.fromARGB(113, 208, 208, 208);
  static Color sliderActiveColor = Color(0xffF8F9FB);
}

class ConstantImagePaths_Intro {
  static List paths = [
    "assets/images/screen1_img1.jpg",
    "assets/images/screen1_img3.jpg",
  ];
  // static String imagePage1 = "assets/images/screen1_img1.jpg";
  // static String imagePage2 = "assets/images/screen1_img3.jpg";
}

class ConstantSVGPaths_Intro {
  static String buttonSVG = "assets/icons/arrow.svg";
  static String headingSVG = "assets/icons/Emoji.svg";
}

class ConstantTexts_Intro {
  static String headingTextLine1_page1 = "Your holiday";
  static String headingTextLine2_page1 = "shopping";
  static String headingTextLine3_page1 = "delivered to Screen";
  static String headingTextLine4_page1 = "one";

  static String descriptionText =
      "There's something for everyone to enjoy with Sweet Shop Favourites Screen 1";
  static String buttonText = "Get Started";
}

class ConstantStyles_Intro {
  static TextStyle headingStyle = TextStyle(
      color: GlobalColors.primaryHeading,
      fontWeight: FontWeight.w700,
      fontSize: 30);
}
