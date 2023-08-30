import 'package:flutter/material.dart';
import 'package:shopping_app/screens/screen1/screen1.dart';
import 'package:shopping_app/screens/screen2/screen2.dart';

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
      home: const Screen2(),
    );
  }
}
