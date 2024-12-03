import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/screens/favorite/components/body.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = '/fav';
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const Body()
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          const Text(
            "Your Favourites",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Consumer<FavouriteProvider>(
            builder: (context, favourite, child) =>
           Text(
              "${favourite.favouriteProducts.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}

