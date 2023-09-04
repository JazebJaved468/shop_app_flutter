import 'package:flutter/material.dart';

import '../../constants/global_constants.dart';
import '../../widgets/custom_appbar_actions.dart';
import '../../widgets/custom_back_button.dart';
import '../shopScreen/constants/shop_screen_constants.dart';

class ProdDetailScreen extends StatefulWidget {
  final int? itemIndex;
  const ProdDetailScreen({super.key, required this.itemIndex});

  @override
  State<ProdDetailScreen> createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  List itemData = ConstantTexts_ShopScreen.itemData;
  int typeIndex = ConstantTexts_ShopScreen.selectedFilterIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title:
            Text("${itemData[typeIndex]['items'][widget.itemIndex]['name']}"),
        actions: [
          CustomAppBarActions(
            showSearchOption: true,
            showCartOption: true,
            cartIconColor: GlobalColors.secondaryBackground,
            cartNotificationStrokeColor: GlobalColors.primaryHeading,
            searchIconColor: GlobalColors.secondaryBackground,
          ),
        ],
      ),
    );
  }
}
