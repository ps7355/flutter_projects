import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CommonFirebaseStorageProvider = Provider(
    (ref) => CommonFirebaseStorage(firebaseStorage: FirebaseStorage.instance));

class CommonFirebaseStorage {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorage({required this.firebaseStorage});

  Future<String> StoreFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }
}
