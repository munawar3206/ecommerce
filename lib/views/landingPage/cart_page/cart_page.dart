import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage(
      {super.key,
      required this.itemName,
      required this.itemImage,
      required this.itemPrice,
      required this.itemDes});
  final String itemName;
  final AssetImage itemImage;
  final int itemPrice;
  final String itemDes;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _counter = 1;
  List<Map<String, dynamic>> cartItems = [];
  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  // void addToCart() {
  //   cartItems.add({
  //     'itemName': widget.itemName,
  //     'itemImage': widget.itemImage,
  //     'itemPrice': widget.itemPrice,
  //     'itemDes': widget.itemDes,
  //     'quantity': _counter,
  //   });
  // }

  void removeFromCart() {
    setState(() {
      cartItems.remove(cartItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Your Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 520,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 220, 220),
                        Color.fromARGB(255, 255, 250, 250)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.itemName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: _decrementCounter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.remove),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '$_counter',
                                          style:
                                              const TextStyle(fontSize: 18.0),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _counter++;
                                            });
                                          },
                                          child: const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.white,
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              widget.itemPrice.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage(widget.itemImage.assetName),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.itemDes,
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of Quantity  : $_counter",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              removeFromCart();
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 190, 190),
                                  content: Text(
                                    'Item removed from Cart Successfully',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  duration:
                                      Duration(seconds: 2), // Adjust as needed
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Price   : ${widget.itemPrice}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Total Price  : ${_counter * widget.itemPrice}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Text("Order now"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
