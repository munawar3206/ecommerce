import 'package:ecommerce/controller/home_provider.dart';
import 'package:ecommerce/views/wishlist/wishlist.dart';
import 'package:ecommerce/views/landingPage/components/list_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 231, 231, 231),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: homeProvider.setSearchQuery,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.red,
                            ),
                            hintText: "Search Product",
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            filled: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavPage(),
                              ));
                        },
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Today Specials",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...homeProvider.items
                    .where((item) => item['content']
                        .toLowerCase()
                        .contains(homeProvider.searchQuery.toLowerCase()))
                    .map((item) => ListContainer(
                          maxline: 2,
                          content: item['content'],
                          price: item['price'],
                          image: item['image'],
                          text: item['text'],
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
