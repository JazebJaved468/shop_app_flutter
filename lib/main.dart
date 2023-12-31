import 'package:flutter/material.dart';
import 'package:shopping_app/screens/homeScreen/home.dart';
import 'package:shopping_app/screens/introScreen/intro_screen.dart';

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
      title: 'Quick Crave',
      theme: ThemeData(
        fontFamily: "Manrope",
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}
