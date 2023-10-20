abstract interface class StorageService {
  // uploads an image
  Future<void> uploadFile(
      {required String path, required String fileName, required String userId});

  // gets an image
  Future<void> getFile({required String path, required String fileName});

}
