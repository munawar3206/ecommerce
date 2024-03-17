import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  List<String> _likedItems = [];

  List<String> get likedItems => _likedItems;

  FavProvider() {
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _likedItems = _prefs.getKeys().where((key) {
      final dynamic value = _prefs.get(key);
      if (value is bool) {
        return value;
      }
      return false;
    }).toList();
    notifyListeners();
  }
}
