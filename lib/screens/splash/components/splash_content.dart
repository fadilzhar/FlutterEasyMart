import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "EasyMart",
          style: TextStyle(
              fontSize: getPropScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "monospace",
              ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kTextColor,
            fontSize: getPropScreenWidth(16),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 200,
          width: 200,
        )
      ],
    );
  }
}
