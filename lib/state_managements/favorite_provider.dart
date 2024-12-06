import 'package:flutter/material.dart';

import '../models/product.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Product> _items = <Product>[];
  final List<Product> _listProducts = demoProducts;

  List<Product> get items => _items;

  void addItem(Product product, {int quantity = 1}) {
    _items.indexWhere((theProduct) => theProduct == product) != -1
    ? null
    : _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((theProduct) => theProduct.id == product.id);
    notifyListeners();
  }

  List<Product> get favouriteProducts{
    return _listProducts.where((product) => product.isFavourite).toList();
  }

  List<Product> get listProducts => _listProducts;

  void toggleFavouriteStatus(int id){
    final productIndex = 
    _listProducts.indexWhere((product) => product.id == id);
    _listProducts[productIndex].isFavourite = 
    !_listProducts[productIndex].isFavourite;
    notifyListeners();
  }
}