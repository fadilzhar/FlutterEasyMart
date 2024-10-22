import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  int curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getPropScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.images[curentIndex],
              child: Image.asset(
                widget.product.images[curentIndex],
              ),
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.product.images.length, (index) {
              return smallImage(index: index);
            }))
      ],
    );
  }

  Widget smallImage({required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          curentIndex = index;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: getPropScreenHeight(5)),
        duration: defaultDuration,
        padding: EdgeInsets.all(getPropScreenWidth(8)),
        height: getPropScreenWidth(48),
        width: getPropScreenWidth(48),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kPrimaryColor.withOpacity(curentIndex == index ? 1 : 0),
            ),
            color: Colors.white),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
