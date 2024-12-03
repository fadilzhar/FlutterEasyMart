import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/products.dart';

class CartProvider extends ChangeNotifier{
final List<Cart> _ListCart = [
  Cart(product: demoProducts[0], numOfItem: 3),
  Cart(product: demoProducts[1], numOfItem: 2),
  Cart(product: demoProducts[3], numOfItem: 1),
];

List<Cart> get cartItems => _ListCart;

void removeCartItem(Cart cartItems){
  _ListCart.removeWhere((item) => item.product.id == cartItems.product.id);
  notifyListeners();
}

void addCartItem(Cart cartItems){
  final index = _ListCart.indexWhere((item) => item.product.id == cartItems.product.id);

  if(index != -1){
    _ListCart[index].numOfItem += cartItems.numOfItem;
  }else{
    _ListCart.add(cartItems);
  }
  notifyListeners();
}

double get totalPrice => double.parse(
  _ListCart
  .fold(
    0.0, (double total, current) => total + current.product.price * current.numOfItem).toStringAsFixed(3)  
);

void clearCart(){
  _ListCart.clear();
  notifyListeners();
}
}