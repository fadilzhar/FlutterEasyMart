import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.image,
    required this.category,
    required this.numOfBrands,
    required this.press,
  });

  final String image, category, numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: Stack(children: [
          Container(
            width: getPropScreenWidth(242),
            height: getPropScreenWidth(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            width: getPropScreenWidth(242),
            height: getPropScreenWidth(100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  const Color(0xff343434).withOpacity(0.4),
                  const Color(0xff343434).withOpacity(0.15)
                ])),
          ),
          Positioned(
            left: getPropScreenWidth(10),
            top: getPropScreenWidth(10),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                      text: "$category\n",
                      style: TextStyle(
                          fontSize: getPropScreenWidth(18),
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: "$numOfBrands Brands")
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
