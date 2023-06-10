import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:interfaces_fedorov_coursework_nao/constants.dart';

class ApiService {
  static Future<String> getImageUrl(String downloadedServerImage) async {
    try {
     
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'GET',
          Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.imageSearch}?url=$downloadedServerImage'));
      request.body = json.encode([{}]);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return (await response.stream.bytesToString());
      } else {
        return (response.reasonPhrase ?? "undefined error");
      }
    } catch (e) {
      log(e.toString());
      return (e.toString());
    }
  }
}
