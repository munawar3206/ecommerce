import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  late SharedPreferences _prefs;

  CartProvider() {
    _initializeSharedPreferences();
  }

  void _initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int getQuantity(String itemName) {
    return _prefs.getInt('quantity_$itemName') ?? 1;
  }

  void setQuantity(String itemName, int quantity) {
    _prefs.setInt('quantity_$itemName', quantity);
    notifyListeners();
  }

  void removeFromCart(String itemName) {
    _prefs.remove('quantity_$itemName');
    notifyListeners();
  }
}
