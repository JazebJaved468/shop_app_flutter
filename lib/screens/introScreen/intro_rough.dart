// import 'package:flutter/material.dart';
// import 'package:shopping_app/constants/global_constants.dart';
// import 'package:shopping_app/screens/introScreen/constants/intro_constants.dart';
// import 'package:shopping_app/screens/introScreen/widgets/custom_button.dart';
// import 'package:shopping_app/screens/introScreen/widgets/custom_description.dart';
// import 'package:shopping_app/screens/introScreen/widgets/custom_heading.dart';
// // import 'package:shopping_app/screens/introScreen/widgets/custom_image.dart';
// import 'package:shopping_app/screens/introScreen/widgets/custom_slider_line.dart';

// class Intro extends StatelessWidget {
//   const Intro({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: [
//           // 1st Page of Screen 1
//           Container(
//             padding: const EdgeInsets.all(40),
//             color: GlobalColors.primaryBackground,
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   //Heading
//                   CustomHeading(
//                     textLine1: "Your holiday",
//                     textLine2: "shopping",
//                     textLine3: "delivered to screen",
//                     textLine4: "one",
//                     svgPath: ConstantSVGPaths_Intro.headingSVG,
//                   ),

//                   // Description
//                   CustomDescription(text: ConstantTexts_Intro.descriptionText),

//                   //Slider
//                   Row(
//                     children: [
//                       CustomSlidingLine(
//                         lineWidth: 25,
//                         // lineHeight: 4,
//                         // lineColor: ConstantColors_Intro.sliderPrimaryColor,
//                         lineBorderRadius: 30,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       CustomSlidingLine(
//                         lineWidth: 40,
//                         lineHeight: 4,
//                         // lineColor: ConstantColors_Intro.sliderSecondaryColor,
//                         lineBorderRadius: 30,
//                       ),
//                     ],
//                   ),

//                   // Image
//                   // CustomImage(
//                   //   imgPath: ConstantImagePaths_Intro.imagePage1,
//                   //   imgWidth: 165,
//                   //   imgHeight: 165,
//                   //   borderRadius: 20,
//                   // ),

//                   // using expanded to place the button at bottom
//                   Expanded(child: Container()),

//                   // Get started Button
//                   CustomButton(
//                     text: ConstantTexts_Intro.buttonText,
//                     backgroundColor: ConstantColors_Intro.buttonBackground,
//                     textColor: ConstantColors_Intro.buttonText,
//                     horizontalPadding: 10,
//                     verticalPadding: 0,
//                     svgSize: 16,
//                     borderRadius: 15,
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // 2nd Page of Screen 1
//           Container(
//             padding: const EdgeInsets.all(40),
//             color: GlobalColors.primaryBackground,
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   //Heading
//                   CustomHeading(
//                     textLine1: ConstantTexts_Intro.headingTextLine1_page1,
//                     textLine2: ConstantTexts_Intro.headingTextLine2_page1,
//                     textLine3: ConstantTexts_Intro.headingTextLine3_page1,
//                     textLine4: ConstantTexts_Intro.headingTextLine4_page1,
//                     svgPath: ConstantSVGPaths_Intro.headingSVG,
//                   ),

//                   // Description
//                   CustomDescription(text: ConstantTexts_Intro.descriptionText),

//                   //Slider
//                   Row(
//                     children: [
//                       CustomSlidingLine(
//                         lineWidth: 40,
//                         lineHeight: 4,
//                         // lineColor: ConstantColors_Intro.sliderSecondaryColor,
//                         lineBorderRadius: 30,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       CustomSlidingLine(
//                         lineWidth: 25,
//                         lineHeight: 4,
//                         // lineColor: ConstantColors_Intro.sliderPrimaryColor,
//                         lineBorderRadius: 30,
//                       ),
//                     ],
//                   ),

//                   // Image
//                   // CustomImage(
//                   //   imgPath: ConstantImagePaths_Intro.imagePage2,
//                   //   imgWidth: 165,
//                   //   borderRadius: 20,
//                   //   imgHeight: 165,
//                   // ),

//                   // using expanded to place the button at bottom
//                   Expanded(child: Container()),

//                   // Get started Button
//                   CustomButton(
//                     text: ConstantTexts_Intro.buttonText,
//                     backgroundColor: ConstantColors_Intro.buttonBackground,
//                     textColor: ConstantColors_Intro.buttonText,
//                     horizontalPadding: 10,
//                     verticalPadding: 0,
//                     svgSize: 16,
//                     borderRadius: 15,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
