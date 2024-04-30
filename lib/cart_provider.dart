import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void add(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void remove(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
