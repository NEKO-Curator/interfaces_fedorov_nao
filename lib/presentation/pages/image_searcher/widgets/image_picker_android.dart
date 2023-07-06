// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interfaces_fedorov_coursework_nao/api/image_searcher_remote.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/links.dart';

class ImagePickerMobilePage extends StatefulWidget {
  const ImagePickerMobilePage({Key? key}) : super(key: key);

  @override
  _ImagePickerMobilePageState createState() => _ImagePickerMobilePageState();
}

class _ImagePickerMobilePageState extends State<ImagePickerMobilePage> {
  File? pickedImage;
  bool isPicked = false;
  String? s;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: isPicked
                ? Image.file(
                    pickedImage!,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * (4.3 / 5),
                  )
                : Container(
                    color: const Color.fromARGB(40, 207, 216, 220),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * (4.3 / 5),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  pickedImage = File(image.path);
                  String sLink = await ImageSearcherRemoteDataImpl()
                      .uploadImageAndSearchAndroid(pickedImage!);
                  setState(() {
                    s = sLink;
                    isPicked = true;
                  });
                }
              },
              child: const Text("Выбрать и найти"),
            ),
          ),
          if (s != null) LinkWidget(s!) else Container(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
