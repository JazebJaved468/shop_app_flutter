import 'package:flutter/material.dart';

import '../../constants/global_constants.dart';
import '../../functions.dart';
import '../../widgets/custom_appbar_actions.dart';
import '../../widgets/custom_back_button.dart';
import '../shopScreen/constants/shop_screen_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdDetailScreen extends StatefulWidget {
  final int? itemIndex;
  const ProdDetailScreen({super.key, required this.itemIndex});

  @override
  State<ProdDetailScreen> createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  //controller
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List images = [
    'assets/images/discount1.jpg',
    'assets/images/discount2.jpg',
    'assets/images/discount3.jpg',
  ];

  //getting filterindex and itemdatalist
  List itemData = ConstantTexts_ShopScreen.itemData;
  int typeIndex = ConstantTexts_ShopScreen.selectedFilterIndex;
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        3,
        (index) => Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
            ));

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          "${toSentenceCase(itemData[typeIndex]['items'][widget.itemIndex]['name'])}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          CustomAppBarActions(
            showSearchOption: false,
            showCartOption: true,
            cartIconColor: GlobalColors.secondaryBackground,
            cartNotificationStrokeColor: GlobalColors.primaryHeading,
          ),
        ],
      ),

      // body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 4,
                  dotWidth: 10,
                  dotColor: const Color(
                    0xffE4E4E4,
                  ),
                  activeDotColor: GlobalColors.yellow),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.red,
          ))
        ],
      ),
    );
  }
}
