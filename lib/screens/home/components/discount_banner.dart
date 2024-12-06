import 'package:flutter/material.dart';

import '../../../constants.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/discount banner.png",
        ),
        fit: BoxFit.cover
        )
      )
    );
  }
}
