// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/constants.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/links.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/presentation_constants.dart';

class ImagePickerWebPage extends StatefulWidget {
  const ImagePickerWebPage({super.key});

  @override
  State<ImagePickerWebPage> createState() => _ImagePickerWebPageState();
}

class _ImagePickerWebPageState extends State<ImagePickerWebPage> {
  List<int>? _selectedFile;
  Uint8List? _bytesData;
  String? s;
  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesData = const Base64Decoder()
              .convert(reader.result.toString().split(",").last);
          _selectedFile = _bytesData;
          s = null;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  Future<String> uploadImage() async {
    var url = Uri.parse("${ApiConstants.baseUrl}/upload");
    var request = http.MultipartRequest("POST", url);

    // Convert your _selectedFile into Uint8List

    request.files.add(http.MultipartFile.fromBytes('document', _selectedFile!,
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Выбрите фото и загрузите его на сервер',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: 200,
                child: MaterialButton(
                  color: buttonMainColor,
                  elevation: 8,
                  highlightElevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  textColor: Colors.white,
                  child: const Text("Выбрать фото"),
                  onPressed: () {
                    startWebFilePicker();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _bytesData != null
                  ? Image.memory(_bytesData!, width: 400, height: 400)
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: MaterialButton(
                  color: buttonMainColor,
                  elevation: 8,
                  highlightElevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  textColor: Colors.white,
                  child: const Text("Загрузить на сервер"),
                  onPressed: () async {
                    var stringResult = await uploadImage();
                    setState(() {
                      s = stringResult;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (s != null) LinkWidget(s!) else Container(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
