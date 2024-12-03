import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/costum_navigation_bar.dart';
import 'package:ui_ecommerce/screens/profile/components/body.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const Body(),
      bottomNavigationBar: const CustomNavigationBar(),
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
      title: Text(
        "Profile",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        Consumer<ThemeProvider>(builder: (context, theme, child,) => 
        IconButton(icon: Icon(
          theme.isDarkMode ? Icons.wb_sunny : Icons.nightlight,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: (){
          theme.toggleTheme(!theme.isDarkMode);
        },)
        )
      ]
    );
  }
}