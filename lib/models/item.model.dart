import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.title,
    required this.size,
    required this.price,
  });

  String title;
  String size;
  double price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        size: json["size"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "size": size,
        "price": price,
      };
}
