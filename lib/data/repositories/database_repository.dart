import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_project_miaged/data/models/item.model.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';

class DatabaseRepository {
  DatabaseRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<QuerySnapshot<Map<String, dynamic>>> getCollection() {
    return _firestore.collection(itemCollection).snapshots();
  }

  Stream<List<Item>> getItems() {
    return _firestore.collection(itemCollection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Item(
          id: doc.id,
          title: doc['title'],
          size: doc['size'],
          price: doc['price'],
          url: doc['url'],
          category: doc['category'],
        );
      }).toList();
    });
  }

  Future<List<Item>> getItemByCategory(String category) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(itemCollection)
        .where('category', isEqualTo: category)
        .get();
    return querySnapshot.docs
        .map((doc) => Item(
              id: doc.id,
              title: doc['title'],
              size: doc['size'],
              price: doc['price'],
              url: doc['url'],
              category: doc['category'],
            ))
        .toList();
  }

  Future<List<DocumentSnapshot>> getItemsByCategory(String category) async {
    QuerySnapshot snapshot = await _firestore.collection(itemCollection).where('category', isEqualTo: category).get();
    return snapshot.docs;
  }

  Future<void> createItem(String title, String size, String price, String url,
      String category) async {
    var item = Item(
        id: 'id',
        title: title,
        size: size,
        price: price,
        url: url,
        category: category);
    await _firestore.collection(itemCollection).add(item.toJson());
  }

  Future<void> deleteItem(String uid) async {
    await _firestore.collection(itemCollection).doc(uid).delete();
  }
}
