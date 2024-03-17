import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late SharedPreferences _prefs;
  List<String> likedItems = [];

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      likedItems = _prefs.getKeys().where((key) {
        final dynamic value =
            _prefs.get(key);
        if (value is bool) {
          return value;
        }
        return false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = likedItems.isEmpty ? "Wishlist" : "Liked Items";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: likedItems.length,
        itemBuilder: (context, index) {
          String itemName = likedItems[index];
          return ListTile(
            title: Text(itemName),
          );
        },
      ),
    );
  }
}
