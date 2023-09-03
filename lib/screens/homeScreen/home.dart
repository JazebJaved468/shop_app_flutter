import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/screens/categoryScreen/widgets/category_body.dart';
import 'package:shopping_app/screens/favouriteScreen/widgets/favourite_body.dart';

import 'package:shopping_app/screens/homeScreen/widgets/home_body.dart';

import '../../constants/global_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List pages = [
    CategoryBody(),
    HomeBody(),
    FavouriteBody(),
    Container(
      color: Colors.pink,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // use from list Pages
        body: pages[selectedIndex],

        // bottom navigation
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            canvasColor: GlobalColors.bottomNavbar,

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
      ),
    );
  }
}
