import 'package:flutter/material.dart';
import 'package:shopping_app/screens/introScreen/widgets/custom_button.dart';
import 'package:shopping_app/screens/introScreen/widgets/custom_description.dart';
import 'package:shopping_app/screens/introScreen/widgets/custom_heading.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/global_constants.dart';
import 'constants/intro_constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  //controller
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        2,
        (index) => Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage(
                      ConstantImagePaths_Intro.paths[index],
                    ),
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(right: 40, left: 40, bottom: 40, top: 50),
        color: GlobalColors.primaryBackground,
        child: Column(
          children: [
            //Heading
            CustomHeading(
              textLine1: "Your holiday",
              textLine2: "shopping",
              textLine3: "delivered to screen",
              textLine4: "one",
              svgPath: ConstantSVGPaths_Intro.headingSVG,
            ),

            // Description
            CustomDescription(text: ConstantTexts_Intro.descriptionText),

            // Product Images
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 80),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    spacing: 9,
                    dotHeight: 4,
                    dotWidth: 15,
                    dotColor: ConstantColors_Intro.sliderInactiveColor,
                    activeDotColor: ConstantColors_Intro.sliderActiveColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: controller,
                // itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
              ),
            ),

            // using expanded to place the button at bottom
            Expanded(child: Container()),

            // Get started Button
            CustomButton(
              text: ConstantTexts_Intro.buttonText,
              backgroundColor: ConstantColors_Intro.buttonBackground,
              textColor: ConstantColors_Intro.buttonText,
              horizontalPadding: 10,
              verticalPadding: 0,
              svgSize: 16,
              borderRadius: 15,
            ),
          ],
        ),
      ),

      // Product Images
      //     Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.all(40),
      //       color: GlobalColors.primaryBackground,
      //       child: CustomHeading(
      //         textLine1: "Your holiday",
      //         textLine2: "shopping",
      //         textLine3: "delivered to screen",
      //         textLine4: "one",
      //         svgPath: ConstantSVGPaths_Intro.headingSVG,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 20),
      //       child: SmoothPageIndicator(
      //         controller: controller,
      //         count: pages.length,
      //         effect: ExpandingDotsEffect(
      //             dotHeight: 4,
      //             dotWidth: 10,
      //             dotColor: const Color(
      //               0xffE4E4E4,
      //             ),
      //             activeDotColor: GlobalColors.yellow),
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     SizedBox(
      //       height: 150,
      //       child: PageView.builder(
      //         controller: controller,
      //         // itemCount: pages.length,
      //         itemBuilder: (_, index) {
      //           return pages[index % pages.length];
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
