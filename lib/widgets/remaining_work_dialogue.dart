import 'package:flutter/material.dart';

import '../constants/global_constants.dart';

class RemainingWorkDialogue extends StatelessWidget {
  final String? message;
  const RemainingWorkDialogue({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: GlobalColors.yellow,
      shape: const RoundedRectangleBorder(),
      content: Text(
        "${message ?? "No Message"}",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      contentPadding: const EdgeInsets.all(20),
    );
  }
}
