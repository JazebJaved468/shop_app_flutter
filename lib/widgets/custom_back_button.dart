import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const  EdgeInsets.only(left: 15),
            child: CircleAvatar(
              backgroundColor:const Color(0xffF8F9FB),
              radius: 8,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 14,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
  }
}