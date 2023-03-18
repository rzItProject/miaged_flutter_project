import 'dart:convert';

ItemCategory itemCategoryFromJson(String str) =>
    ItemCategory.fromJson(json.decode(str));

String itemCategoryToJson(ItemCategory data) => json.encode(data.toJson());

class ItemCategory {
  ItemCategory({
    required this.id,
    required this.category,
    required this.count,
  });

  String id;
  String category;
  String count;

  factory ItemCategory.fromJson(Map<String, dynamic> json) => ItemCategory(
        id: json["id"],
        category: json["category"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "count": count,
      };
}
