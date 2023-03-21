import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_project_miaged/data/models/customer.model.dart';
import 'package:flutter_app_project_miaged/data/repositories/auth_repository.dart';
import 'package:flutter_app_project_miaged/data/repositories/customer_repository.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for CustomerRepository
final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepository(FirebaseFirestore.instance);
});

//Provider for AuthenticationRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final customerRepo = ref.watch(customerRepositoryProvider);
  return AuthRepository(FirebaseAuth.instance, customerRepo);
});

final authStateProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(authRepositoryProvider).onAuthStateChanges;
});

final currentUserProvider = FutureProvider<User?>((ref) async {
  final auth = ref.watch(authRepositoryProvider);
  return auth.currentUser;
});

final customerStreamProvider =
    StreamProvider.autoDispose.family<Customer?, String>((ref, uid) {
  return ref.watch(customerRepositoryProvider).getCustomerStreamByUid(uid);
});

final authStateCustomerProvider = StreamProvider.autoDispose<Customer?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider).onAuthStateChanges;
  return authRepo.asyncMap((user) async {
    if (user != null) {
      final customerData = await ref
          .read(customerRepositoryProvider)
          .firestore
          .collection(customerCollection)
          .doc(user.uid)
          .get();
      return Customer?.fromJson(customerData.data() ?? {});
    } else {
      return null;
    }
  });
});

// Provider for fetching all customers
final allCustomersProvider = StreamProvider.autoDispose<List<Customer>>((ref) {
  final customerRepository = ref.watch(customerRepositoryProvider);
  return customerRepository.getAllCustomers();
});

// Provider for fetching a single customer by ID
final customerByIdProvider =
    FutureProviderFamily<Customer?, String>((ref, customerId) async {
  final customerRepository = ref.watch(customerRepositoryProvider);
  return customerRepository.getCustomerByUid(customerId);
});

// Provider for adding a new customer
final addCustomerProvider = FutureProvider.autoDispose
    .family<DocumentReference, Customer>((ref, customer) async {
  final customerRepository = ref.watch(customerRepositoryProvider);
  return customerRepository.addCustomer(customer);
});

// Provider for updating an existing customer
final updateCustomerProvider =
    FutureProvider.autoDispose.family<void, Customer>((ref, customer) async {
  final customerRepository = ref.watch(customerRepositoryProvider);
  return customerRepository.updateCustomer(customer);
});

// Provider for deleting an existing customer
final deleteCustomerProvider =
    FutureProvider.autoDispose.family<void, String>((ref, customerId) async {
  final customerRepository = ref.watch(customerRepositoryProvider);
  return customerRepository.deleteCustomer(customerId);
});
