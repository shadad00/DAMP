abstract interface class StorageService {
  // uploads an image
  Future<String> uploadFile(
      {required String path, required String fileName, required String userId});

  // gets an image
  Future<String> getFileURL({required String path});

}
