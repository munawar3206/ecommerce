import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
final List<Map<String, dynamic>> items = [
    {
      'content': 'Grilled Chicken With Tuna Sauce',
      'price': 130,
      'image': AssetImage("assets/download.jpeg"),
      'text':
          "Poke bowls are one of my absolute favourite things to make, especially on busy weeknights. They’re delicious, healthy, an easy way to get lots of vegetables in and brilliant for using up leftovers. And making them yourself is so much better than getting a takeaway! You can control what goes on top and really make them how you like.",
    },
    {
      'content': 'Kung Poa Chicken',
      'price': 250,
      'image': AssetImage("assets/download (1).jpeg"),
      'text':
          "Kung Pao Chicken is highly addictive stir-fried chicken with the perfect combination of salty, sweet and spicy flavour! Make it better than Chinese take out right at home! With crisp-tender chicken pieces and some crunchy veggies thrown in, this is one Kung Pao chicken recipe hard to pass up! .",
    },
    {
      'content': 'Masala Dosa',
      'price': 90,
      'image': AssetImage("assets/download (2).jpeg"),
      'text':
          "A type of thin pancake made with crushed lentils and rice, originally from southern India: Dosas are served hot, often with chutney and sambar. My favorite dish is dosa, a big Indian pancake, with all sorts of fillings such as paneer or potato.",
    },
    {
      'content': 'Panni Puri',
      'price': 70,
      'image': AssetImage("assets/download (3).jpeg"),
      'text': "These 'water balls' also known as pani puri.......",
    },
  ];

 String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }
}