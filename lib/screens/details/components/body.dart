import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/components/color_picker.dart';
import 'package:ui_ecommerce/screens/details/components/detail_description.dart';
import 'package:ui_ecommerce/screens/details/components/rounded_container.dart';
import 'package:ui_ecommerce/screens/details/components/image_detail.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetail(product: product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(product: product),
                  SizedBox(height: getPropScreenWidth(40)),
                  ColorPicker(product: product),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropScreenWidth(70),
                      vertical: getPropScreenWidth(40)
                    ),
                    child: MyDefaultButton(
                      press: (){},
                      text: "Add to Cart",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
