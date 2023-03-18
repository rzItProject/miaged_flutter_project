import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item(
      {required this.id,
      required this.title,
      required this.size,
      required this.price,
      required this.url,
      required this.category});

  String id;
  String title;
  String size;
  String price;
  String url;
  String category;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        size: json["size"],
        price: json["price"],
        url: json["url"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "size": size,
        "price": price,
        "url": url,
        "category": category
      };
}
