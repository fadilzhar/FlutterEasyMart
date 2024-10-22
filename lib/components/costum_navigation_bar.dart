import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enums.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class CostumNavigationBar extends StatelessWidget {
  const CostumNavigationBar({
    super.key,
    required this.menu,
  });

  final MenuState menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getPropScreenWidth(15)),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: (Radius.circular(30)),
          topRight: (Radius.circular(30)),
        ),
        color: kPrimaryColor.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xffdadada).withOpacity(0.30),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (Route<dynamic> routes) => false);
              },
              icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
                  color: MenuState.home == menu
                      ? kPrimaryColor
                      : Colors.white.withOpacity(0.5))),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/Heart Icon.svg", color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg", color: Colors.white)),
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, ProfileScreen.routeName, (Route<dynamic> routes) => false);
              },
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: MenuState.profile == menu
                      ? kPrimaryColor
                      : Colors.white.withOpacity(0.5))),
        ],
      ),
    );
  }
}