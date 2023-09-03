import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/screens/testscreens/testscreen1.dart';
import 'package:shopping_app/screens/testscreens/testscreen2.dart';


import '../../constants/global_constants.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int selectedIndex = 0;
  List screens = [Screen1(), Screen2(), Screen1(), Screen2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestScreen"),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          canvasColor: const Color(0xff1E222B),
          dialogBackgroundColor: Colors.red,

          // Set canvasColor to transparent
        ),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            iconSize: 20,
            useLegacyColorScheme: false,
            selectedItemColor: const Color(0xffE0B420),
            unselectedItemColor: GlobalColors.primaryHeading,
            currentIndex: selectedIndex,
            onTap: (value) {
              // ignore: avoid_print
              print(value);
              selectedIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
                label: "Favourites",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.a,
                ),
                label: "More",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
