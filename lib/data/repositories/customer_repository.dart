import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_project_miaged/data/models/customer.model.dart';

import 'package:flutter_app_project_miaged/utils/constants.dart';

class CustomerRepository {
  CustomerRepository(this.firestore);

  final FirebaseFirestore firestore;

  Future<Customer?> getCustomerByUid(String uid) async {
    final snapshot = await firestore
        .collection(customerCollection)
        .where('userid', isEqualTo: uid)
        .get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
    final customer = Customer.fromJson(snapshot.docs.first.data());
    return customer;
  }

  Stream<Customer> getCustomerStreamByUid(String uid) {
    return firestore
        .collection(customerCollection)
        .doc(uid)
        .snapshots()
        .map((doc) => Customer.fromJson(doc.data() ?? {}));
  }

  Future<DocumentReference> addCustomer(Customer customer) async {
    DocumentReference ref =
        firestore.collection(customerCollection).doc(customer.id);
    // customer.id = ref.id;
    await ref.set(customer.toJson());
    return ref;
  }

  Stream<List<Customer>> getAllCustomers() {
    return firestore.collection(customerCollection).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Customer.fromJson(doc.data())).toList());
  }

  Future<void> updateCustomer(Customer customer) async {
    await firestore
        .collection(customerCollection)
        .doc(customer.id)
        .update(customer.toJson());
  }

  Future<void> deleteCustomer(String customerId) async {
    await firestore.collection(customerCollection).doc(customerId).delete();
  }
}
