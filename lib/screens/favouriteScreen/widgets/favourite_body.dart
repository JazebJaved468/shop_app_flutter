
import 'package:flutter/material.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pink,
        child: Text("Favourites"),
      ),
    );
  }
}