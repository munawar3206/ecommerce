
class ProductItem {
  final String itemName;
  final String itemImage;
  final int itemPrice;
  final String itemDes;

  ProductItem({
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
    required this.itemDes,
  });

  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'itemImage': itemImage,
      'itemPrice': itemPrice,
      'itemDes': itemDes,
    };
  }

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      itemName: json['itemName'],
      itemImage: json['itemImage'],
      itemPrice: json['itemPrice'],
      itemDes: json['itemDes'],
    );
  }
}
