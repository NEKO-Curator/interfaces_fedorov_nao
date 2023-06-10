// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interfaces_fedorov_coursework_nao/api/firebase_storage_api.dart';
import 'package:interfaces_fedorov_coursework_nao/screens/image_screen/widgets/links.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? pickedImage;
  bool isPicked = false;
  String? s;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: isPicked
                    ? Image.file(
                        pickedImage!,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * (4 / 3),
                      )
                    : Container(
                        color: Colors.blueGrey[100],
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * (4 / 3),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    pickedImage = File(image.path);
                    String sLink = await uploadFile(pickedImage!);
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
      ),
    );
  }
}
