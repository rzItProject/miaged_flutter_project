import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_project_miaged/models/item.model.dart';
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
        );
      }).toList();
    });
  }

  Future<void> createItem(
      String title, String size, String price, String url) async {
    var item = Item(id: 'id', title: title, size: size, price: price, url: url);
    await _firestore.collection(itemCollection).add(item.toJson());
  }

  Future<void> deleteItem(String uid) async {
    await _firestore.collection(itemCollection).doc(uid).delete();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getItem() async {
    return await _firestore.collection(itemCollection).get();
  }
}
