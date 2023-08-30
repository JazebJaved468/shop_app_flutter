import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_constants.dart';
import 'package:shopping_app/screens/screen1/constants/screen1_constants.dart';
import 'package:shopping_app/screens/screen1/widgets/custom_button.dart';
import 'package:shopping_app/screens/screen1/widgets/custom_description.dart';
import 'package:shopping_app/screens/screen1/widgets/custom_heading.dart';
import 'package:shopping_app/screens/screen1/widgets/custom_image.dart';
import 'package:shopping_app/screens/screen1/widgets/custom_slider_line.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          // 1st Page of Screen 1
          Container(
            padding: const EdgeInsets.all(40),
            color: GlobalColors.primaryBackground,
            child: SafeArea(
              child: Column(
                children: [
                  //Heading
                  CustomHeading(
                    textLine1: "Your holiday",
                    textLine2: "shopping",
                    textLine3: "delivered to screen",
                    textLine4: "one",
                    svgPath: ConstantSVGPaths_Screen1.headingSVG,
                  ),

                  // Description
                  CustomDescription(text: ConstantTexts_Screen1.descriptionText),

                  //Slider
                  Row(
                    children: [
                      CustomSlidingLine(
                        lineWidth: 25,
                        lineHeight: 4,
                        lineColor: ConstantColors_Screen1.sliderPrimaryColor,
                        lineBorderRadius: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomSlidingLine(
                        lineWidth: 40,
                        lineHeight: 4,
                        lineColor: ConstantColors_Screen1.sliderSecondaryColor,
                        lineBorderRadius: 30,
                      ),
                    ],
                  ),

                  // Image
                  CustomImage(
                    imgPath: ConstantImagePaths_Screen1.imagePage1,
                    imgWidth: 165,
                    imgHeight: 165,
                    borderRadius: 20,
                  ),

                  // using expanded to place the button at bottom
                  Expanded(child: Container()),

                  // Get started Button
                  CustomButton(
                    text: ConstantTexts_Screen1.buttonText,
                    backgroundColor: ConstantColors_Screen1.buttonBackground,
                    textColor: ConstantColors_Screen1.buttonText,
                    horizontalPadding: 10,
                    verticalPadding: 0,
                    svgSize: 16,
                    borderRadius: 15,
                  ),
                ],
              ),
            ),
          ),

          // 2nd Page of Screen 1
          Container(
            padding: const EdgeInsets.all(40),
            color: GlobalColors.primaryBackground,
            child: SafeArea(
              child: Column(
                children: [
                  //Heading
                  CustomHeading(
                    textLine1: ConstantTexts_Screen1.headingTextLine1_page1,
                    textLine2: ConstantTexts_Screen1.headingTextLine2_page1,
                    textLine3: ConstantTexts_Screen1.headingTextLine3_page1,
                    textLine4: ConstantTexts_Screen1.headingTextLine4_page1,
                    svgPath: ConstantSVGPaths_Screen1.headingSVG,
                  ),

                  // Description
                  CustomDescription(text: ConstantTexts_Screen1.descriptionText),

                  //Slider
                  Row(
                    children: [
                      CustomSlidingLine(
                        lineWidth: 40,
                        lineHeight: 4,
                        lineColor: ConstantColors_Screen1.sliderSecondaryColor,
                        lineBorderRadius: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomSlidingLine(
                        lineWidth: 25,
                        lineHeight: 4,
                        lineColor: ConstantColors_Screen1.sliderPrimaryColor,
                        lineBorderRadius: 30,
                      ),
                    ],
                  ),

                  // Image
                  CustomImage(
                    imgPath: ConstantImagePaths_Screen1.imagePage2,
                    imgWidth: 165,
                    borderRadius: 20,
                    imgHeight: 165,
                  ),

                  // using expanded to place the button at bottom
                  Expanded(child: Container()),

                  // Get started Button
                  CustomButton(
                    text: ConstantTexts_Screen1.buttonText,
                    backgroundColor: ConstantColors_Screen1.buttonBackground,
                    textColor: ConstantColors_Screen1.buttonText,
                    horizontalPadding: 10,
                    verticalPadding: 0,
                    svgSize: 16,
                    borderRadius: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
