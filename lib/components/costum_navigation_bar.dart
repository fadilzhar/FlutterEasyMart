import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/favorite/favourite_screen.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class CustomNavigationBar extends StatefulWidget {
  static String routeName = "/custom_navigation_bar";
  const CustomNavigationBar({super.key,});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const Text("Chat"),
    const ProfileScreen(),
    const FavouriteScreen()
  ];

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kTextColor,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          _buildNavItem(
            iconPath: "assets/icons/Shop Icon.svg",
            label: "Home",
            index: 0,
          ),
          _buildNavItem(
            iconPath: "assets/icons/Heart Icon.svg",
            label: "Favorite",
            index: 1,
          ),
          _buildNavItem(
            iconPath: "assets/icons/Chat bubble Icon.svg",
            label: "Chat",
            index: 2,
          ),
          _buildNavItem(
            iconPath: "assets/icons/User Icon.svg",
            label: "Profile",
            index: 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        color: _selectedIndex == index ? kPrimaryColor : kTextColor,
      ),
      label: label,
    );
  }
}