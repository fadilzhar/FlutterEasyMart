import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name, icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getPropScreenWidth(55),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            height: getPropScreenWidth(55),
            width: getPropScreenWidth(55),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 125, 125),
                borderRadius: BorderRadius.circular(15)),
            child: SvgPicture.asset(icon, color: Colors.white,),
          ),
          SizedBox(height: getPropScreenHeight(5)),
          Text(
            name,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
