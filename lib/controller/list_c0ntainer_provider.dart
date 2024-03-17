import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListProvider with ChangeNotifier {
  bool isLiked = false;

  Future<void> checkLiked(String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool liked = prefs.getBool(content) ?? false;
    isLiked = liked;
    notifyListeners();
  }

  Future<void> toggleLike(String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLiked = !isLiked;
    await prefs.setBool(content, isLiked);
    notifyListeners();
  }
}
