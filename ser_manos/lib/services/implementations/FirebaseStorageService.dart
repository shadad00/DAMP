import 'dart:io';

import '../interfaces/StorageService.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class FirebaseStorageService implements StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadFile(
      {required String path,
      required String fileName,
      required String userId}) async {
    File file = File(path);
    try {
      await storage.ref('profilePics/$userId').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Future<void> getFile({required String path, required String fileName}) async {
    try {
      await storage.ref('profilePics/$fileName').getData();
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}
