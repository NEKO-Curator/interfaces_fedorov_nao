import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:interfaces_fedorov_coursework_nao/common/errors/exceptions.dart';
import 'package:interfaces_fedorov_coursework_nao/data/datasources/image_picker/base_image_picker.dart';

class ImagePickerImpl implements BasePicker {
  @override
  Future<List<int>> pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    final completer = Completer<List<int>?>();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        final bytesData = const Base64Decoder()
            .convert(reader.result.toString().split(",").last);
        final selectedFile = bytesData;
        completer.complete(selectedFile);
      });
      reader.readAsDataUrl(file);
    });

    final result = await completer.future;
    if (result == null) {
      throw PickerException("Failed to load the image.");
    }
    return result;
  }
}
