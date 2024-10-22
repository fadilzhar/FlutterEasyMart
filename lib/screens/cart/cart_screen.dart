import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/screens/cart/components/body.dart';
import 'package:ui_ecommerce/screens/cart/components/cart_bottom_navigation.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart-screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const Body(),
      bottomNavigationBar: const CartBottomNavigation(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      centerTitle: true,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "${ListCart.length} items",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

