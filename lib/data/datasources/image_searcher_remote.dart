import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:interfaces_fedorov_coursework_nao/common/utils/cert.dart';

abstract class ImageSearcherRemoteData {
  Future<String> uploadImageAndSearchWeb(List<int> imageFile);
  Future<String> uploadImageAndSearchAndroid(File imageFile);
}

class ImageSearcherRemoteDataImpl implements ImageSearcherRemoteData {
  static const _apiUrl = 'https://hentai.ninja/api/v1';

  @override
  Future<String> uploadImageAndSearchWeb(List<int> imageFile) async {
    var request = http.MultipartRequest("POST", Uri.parse("$_apiUrl/upload"));

    request.files.add(http.MultipartFile.fromBytes('document', imageFile,
        contentType: MediaType('image', 'jpeg'), filename: "anyname.jpg"));

    var response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception(
          'Server responded with status code ${response.statusCode}.');
    }
  }

  @override
  Future<String> uploadImageAndSearchAndroid(File imageFile) async {
    final client = await getSSLPinningClient();

    var request = http.MultipartRequest('POST', Uri.parse(_apiUrl));

    request.files.add(
      await http.MultipartFile.fromPath(
        'document',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var response = await client.send(request);
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception('Failed to upload image');
    }
  }
}
