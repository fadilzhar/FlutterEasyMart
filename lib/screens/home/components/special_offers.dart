import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/home/components/section_title.dart';
import 'package:ui_ecommerce/screens/home/components/special_offer_card.dart';
import 'package:ui_ecommerce/size_config.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(
            title: "Special For You",
          ),
        ),
        SizedBox(height: getPropScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
            child: Row(
              children: [
                SpecialOfferCard(
                    image: "assets/images/Image Banner 2.png",
                    category: "Smartphone",
                    numOfBrands: "18",
                    press: () {}),
                SpecialOfferCard(
                    image: "assets/images/Image Banner 3.png",
                    category: "Fasion",
                    numOfBrands: "24",
                    press: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
