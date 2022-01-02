import 'dart:io';
import 'firebase_storage_api.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {

  FirebaseStorageAPI _firebaseStorageAPI = FirebaseStorageAPI();

  Future<UploadTask> uploadFile (String path, File image) async => _firebaseStorageAPI.uploadFile(path, image);

}