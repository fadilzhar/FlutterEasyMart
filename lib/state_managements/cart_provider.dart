import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Cart> _items = <Cart>[];
   final List<Cart> _listCart = [
   
  ];

  List<Cart> get items => _items;

  void addProduct(Product product, {int quantity = 1}) {
    _items.indexWhere((cart) => cart.product == product) != -1
    ? _items[_items.indexWhere((cart) => cart.product == product)].numOfItem += quantity
    : _items.add(Cart(product: product, numOfItem: quantity));
    notifyListeners();
  }

  void removeCart(Cart cart) {
    _items.removeWhere((cartItem) => cartItem.product.id == cart.product.id);
    notifyListeners();
  }

   List<Cart> get cartItems => _listCart;

   void removeCartItem(Cart cartItem) {
    _listCart.removeWhere((item) => item.product.id == cartItem.product.id);
    notifyListeners();
  }

  void addCartItem(Cart cartItem) {
    final index =
        _listCart.indexWhere((item) => item.product.id == cartItem.product.id);

    if (index != -1) {
      _listCart[index].numOfItem += cartItem.numOfItem;
    } else {
      _listCart.add(cartItem);
    }
    notifyListeners();
  }

    double get totalPrice => double.parse(
        _listCart
            .fold(
                0.0,
                (double total, current) =>
                    total + current.product.price * current.numOfItem)
            .toStringAsFixed(2),
      );

        void clearCart() {
    _listCart.clear();
    notifyListeners();
  }

}