import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class BannerDiscountHome extends StatelessWidget {
  const BannerDiscountHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.all(getPropScreenWidth(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage("assets/images/sean-oulashin-KMn4VEeEPR8-unsplash.jpg"), fit: BoxFit.cover),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "A Summer Surprise\n", style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: getPropScreenWidth(15),
              fontWeight: FontWeight.w900
            )),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                  fontSize: getPropScreenWidth(30),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}