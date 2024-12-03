import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/products.dart';

class FavouriteProvider with ChangeNotifier{
  final List<Product> _listProducts =  demoProducts;

  List<Product> get favouriteProducts {
    return _listProducts.where((product) => product.isFavourite).toList();
  }


  List<Product> get listProduct => _listProducts;

  void toggleFavouriteStatus(int id){
    final productIndex =
    _listProducts.indexWhere((product) => product.id == id);
    _listProducts[productIndex].isFavourite =
    !_listProducts[productIndex].isFavourite;
    notifyListeners();
  }
}