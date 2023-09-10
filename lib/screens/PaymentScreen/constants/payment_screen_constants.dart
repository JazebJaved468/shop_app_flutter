import 'package:flutter/material.dart';

import '../../../constants/global_constants.dart';

class ConstantColors_paymentScreen {
  static Color label = Color(0xff8891A5);
}

class ConstantStyles_paymentScreen {
  static TextStyle label = TextStyle(
    color: ConstantColors_paymentScreen.label,
    fontWeight: FontWeight.w700,
  );

  static TextStyle inputText = TextStyle(
    color: GlobalColors.secondaryBackground,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
