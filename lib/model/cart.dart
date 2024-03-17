import 'dart:convert';

import 'package:ecommerce/model/model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CartManager {
  static const _cartKey = 'cartItems';

  static Future<void> addToCart(ProductItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItemsString = prefs.getStringList(_cartKey) ?? [];
    cartItemsString.add(jsonEncode(item.toJson())); // Convert Map to JSON string
    await prefs.setStringList(_cartKey, cartItemsString);
  }

  static Future<List<ProductItem>> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItemsString = prefs.getStringList(_cartKey) ?? [];
    List<ProductItem> cartItems = cartItemsString
        .map((itemString) => ProductItem.fromJson(jsonDecode(itemString)))
        .toList();
    return cartItems;
  }

  static Future<void> clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
