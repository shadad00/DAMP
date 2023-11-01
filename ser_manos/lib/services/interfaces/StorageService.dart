abstract interface class StorageService {
  // uploads an image
  Future<String> uploadFile(
      {required String path, required String userId});

  // gets an image
  Future<String> getFileURL({required String path});

}
