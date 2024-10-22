// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemPopularProduct extends StatelessWidget {
  const ItemPopularProduct({
    super.key,
    required this.product, required this.press,
  });

  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
      child: SizedBox(
        width: getPropScreenWidth(140),
        child: GestureDetector(
          onTap: press,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.05,
                child: Container(
                  padding: EdgeInsets.all(getPropScreenWidth(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSecondaryColor.withOpacity(0.2)),
                  child: Image.asset(
                    product.images[0],
                  ),
                ),
              ),
              SizedBox(height: getPropScreenHeight(15)),
              Text(
                product.title,
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                        fontSize: getPropScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor),
                  ),
                  Container(
                    height: getPropScreenWidth(28),
                    width: getPropScreenWidth(28),
                    padding: EdgeInsets.all(getPropScreenWidth(8)),
                    decoration: BoxDecoration(
                      color: product.isFavourite == true
                          ? kPrimaryColor.withOpacity(0.2)
                          : kSecondaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: product.isFavourite == true
                            ? Colors.red
                            : kSecondaryColor,
                        size: getPropScreenWidth(13),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
