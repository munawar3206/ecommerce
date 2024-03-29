import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

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
        final dynamic value = _prefs.get(key);
        if (value is bool) {
          return value;
        }
        return false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlist",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: likedItems.isEmpty
          ? const Center(
              child: Text(
                "No liked items",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            )
          : ListView.builder(
              itemCount: likedItems.length,
              itemBuilder: (context, index) {
                String itemName = likedItems[index];
                return ListTile(
                  title: Text(
                    itemName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
    );
  }
}
