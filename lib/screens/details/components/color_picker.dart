
import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/rounded_icon_btn.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentSelectedColor = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            widget.product.colors.length, 
            (index){
              final color = widget.product.colors[index];
              return GestureDetector(
                onTap: (){
                  setState(() {
                    currentSelectedColor = index;
                  });
                },
                child: ItemColorDot(
                  color: color,
                  isSelected: index == currentSelectedColor,
                )
              );
            }
          ),
          const Spacer(),
          Row(
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                showShadow: true,
                press: totalSelected > 1 ?(){
                  setState(() {
                    if (totalSelected>1) {
                      totalSelected--;
                    }
                  });
                }:null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "$totalSelected", 
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
              ),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: (){
                  setState(() {
                    totalSelected++;
                  });
                }
              )
            ],
          )
        ],
      ),
    );
  }
}

class ItemColorDot extends StatelessWidget {
  const ItemColorDot({
    super.key, required this.color, this.isSelected = false
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      margin: EdgeInsets.only(right: getPropScreenWidth(10)),
      padding: EdgeInsets.all(getPropScreenWidth(8)),
      height: getPropScreenWidth(isSelected ? 40 : 20),
      width: getPropScreenWidth(isSelected ? 40 : 20),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? kPrimaryColor : Colors.transparent,
          width: 2
        )
      ),
    );
  }
}