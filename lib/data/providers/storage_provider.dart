import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app_project_miaged/data/repositories/storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageRepositoryProvider = Provider<StorageRepository>(
    (ref) => StorageRepository(FirebaseStorage.instance));
