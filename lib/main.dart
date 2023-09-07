import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cartScreen/cart_screen.dart';
import 'package:shopping_app/screens/cartScreen/full_cart_screen.dart';
import 'package:shopping_app/screens/introScreen/intro.dart';
import 'package:shopping_app/screens/homeScreen/home.dart';
import 'package:shopping_app/screens/productDetailScreen/prod_detail_screen.dart';
import 'package:shopping_app/screens/testscreens/testscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Manrope",
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
