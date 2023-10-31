import 'dart:io';


import '../interfaces/StorageService.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class FirebaseStorageService implements StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<String> uploadFile(
      {required String path,
      required String fileName,
      required String userId}) async {
    File file = File(path);
    try {
      await storage.ref('profilePics/$userId').putFile(file);
      final URL = await storage.ref('profilePics/$userId').getDownloadURL();
      return URL;
    } on firebase_core.FirebaseException catch (e) {
      return "Error: File upload failed"; // You can customize the error message
    }
  }

  @override
  Future<String> getFileURL({required String path}) async {
    try {
      return await storage.ref(path).getDownloadURL();
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return "";
    }
  }
}
