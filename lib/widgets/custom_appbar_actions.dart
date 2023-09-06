import 'package:flutter/material.dart';

// import '../constants/global_constants.dart';
import 'custom_cart_icon.dart';
import 'custom_search_icon.dart';

class CustomAppBarActions extends StatelessWidget {
  final bool showSearchOption;
  final bool showCartOption;
  final Color? cartIconColor;
  final Color? searchIconColor;
  final Color? cartNotificationStrokeColor;
  const CustomAppBarActions(
      {super.key,
      required this.showSearchOption,
      required this.showCartOption,
      this.cartIconColor,
      this.searchIconColor,
      this.cartNotificationStrokeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Wrap(
        children: [
          Visibility(
            visible: showSearchOption,
            child: CustomSearchIcon(
              iconColor: searchIconColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Visibility(
            visible: showCartOption,
            child: CustomCartIcon(
              iconColor: cartIconColor,
              strokeColor: cartNotificationStrokeColor,
            ),
          ),
        ],
      ),
    );
  }
}
