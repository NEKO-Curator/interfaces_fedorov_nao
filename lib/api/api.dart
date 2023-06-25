import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  static Future<String> uploadImageAndSearch(String url, File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(
      await http.MultipartFile.fromPath(
        'document',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception('Failed to upload image');
    }
  }

  static Future<String> uploadImageWeb(Uint8List imageData, String url,
      String mimeType, String imageName) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    // Вытаскиваем mimeType
    // final typeData = mimeType.split('/');
    // final type = typeData[0];
    // final subtype = typeData[1];
    //final mediaType = MediaType(type, subtype);

    request.files.add(
      http.MultipartFile.fromBytes(
        'document', // field name of the file
        imageData, // image data in bytes
        //filename: imageName,
        // contentType: mediaType,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception('Failed to upload image');
    }
  }
}
