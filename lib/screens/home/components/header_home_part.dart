import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/screens/cart/cart_screen.dart';
import 'package:ui_ecommerce/screens/home/components/icon_with_trigger.dart';
import 'package:ui_ecommerce/screens/home/components/search_field.dart';
import 'package:ui_ecommerce/size_config.dart';

class HeaderHomePart extends StatelessWidget {
  const HeaderHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: IconWithTrigger(
              svgIcon: "assets/icons/Cart Icon.svg",
              trigger: ListCart.length.toString(),
            ),
          ),
          const IconWithTrigger(
            svgIcon: "assets/icons/Bell.svg",
          ),
        ],
      ),
    );
  }
}




