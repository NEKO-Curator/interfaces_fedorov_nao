// ignore_for_file: library_prefixes, depend_on_referenced_packages

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:interfaces_fedorov_coursework_nao/api/api.dart';
import 'package:path/path.dart' as Path;

Future<String> uploadFile(File file) async {
  try {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('uploads/${Path.basename(file.path)}');

    await ref.putFile(file);

    String downloadURL = await ref.getDownloadURL();
    String ans = await ApiService.getImageUrl('$downloadURL.jpg');
    return ans;
  } catch (e) {
    // e.g, e.code == 'canceled'
  }
  return "error";
}
