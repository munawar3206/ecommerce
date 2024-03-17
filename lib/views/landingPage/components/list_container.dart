import 'package:ecommerce/views/landingPage/cart_page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListContainer extends StatefulWidget {
  const ListContainer({
    super.key,
    required this.content,
    required this.price,
    required this.text,
    required this.image,
    required this.maxline,
  });

  final String content;
  final int price;
  final String text;
  final AssetImage image;
  final int maxline;

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _checkLiked(); 
  }

 
  Future<void> _checkLiked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool liked = prefs.getBool(widget.content) ?? false;
    setState(() {
      isLiked = liked;
    });
  }


  Future<void> _toggleLike() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = !isLiked; 
    });
    await prefs.setBool(widget.content, isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 222, 220),
                    ),
                    child: const Text(
                      " Best Seller ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 144, 136),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "All day Breakfast",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color.fromARGB(255, 168, 168, 168),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.content,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee_outlined,
                        size: 19,
                      ),
                      Text(
                        widget.price.toString(), // Convert price to String
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.text,
                    maxLines: widget.maxline,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _toggleLike(); // Toggle like state
                        },
                        icon: isLiked
                            ? const Icon(
                                IconlyBold.heart,
                                color: Color.fromARGB(255, 255, 17, 17),
                              )
                            : const Icon(
                                IconlyLight.heart,
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                      ),
                      const Icon(
                        IconlyLight.send,
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: widget.image, // Use widget.image directly
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPage(
                                  itemName: widget.content,
                                  itemImage: widget.image,
                                  itemPrice: widget.price,
                                  itemDes: widget.text,
                                ),
                              ));
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
