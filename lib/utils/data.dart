import 'package:flutter_app_project_miaged/data/models/category.dart';

final categories = [
  ItemCategory(
    id: 'id',
    category: 'tous',
    count: '10',
  ),
  ItemCategory(
    id: 'id',
    category: 'chaussures',
    count: '10',
  ),
  ItemCategory(
    id: 'id',
    category: 'vetements',
    count: '10',
  ),
  ItemCategory(
    id: 'id',
    category: 'accessoires',
    count: '10',
  ),
];

getCategoryIndex(String category) {
  return categories.indexWhere((element) => element.category == category);
}
