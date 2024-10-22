import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/size_config.dart';

class CostomSuffixIcon extends StatelessWidget {
  const CostomSuffixIcon({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getPropScreenWidth(20),
        getPropScreenWidth(20),
        getPropScreenWidth(20),
      ),
      child: SvgPicture.asset(
        icon,
        width: getPropScreenWidth(18),
      ),
    );
  }
}
