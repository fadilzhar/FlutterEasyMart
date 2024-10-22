import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/social_media_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/sign_up/components/sign_up_form.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Register Account",
                        style: headingStyle.copyWith(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: getPropScreenWidth(30),
                        ),
                      ),
                      const Text(
                        "Complete your details or continue\nwith social media",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.06),
                      const SignUpForm(),
                      SizedBox(height: SizeConfig.screenHeight * 0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaButton(
                            icon: "assets/icons/google-icon.svg",
                            press: () {},
                          ),
                          const SizedBox(width: 15),
                          SocialMediaButton(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {},
                          ),
                          const SizedBox(width: 15),
                          SocialMediaButton(
                            icon: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      const Text(
                        "By continuing you confirm that you agree\nwith our Terms and Conditions",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget untuk Social Media Button dengan Bayangan
class SocialMediaButton extends StatelessWidget {
  final String icon;
  final VoidCallback press;

  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: SocialMediaIcon(icon: icon, press: press),
      ),
    );
  }
}
