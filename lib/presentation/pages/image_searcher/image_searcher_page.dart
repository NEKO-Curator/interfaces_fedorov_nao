import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/image_picker_android.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/image_picker_web.dart';

class ImageSearcherWidget extends StatelessWidget {
  const ImageSearcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isAndroid) {
      return const ImagePickerMobilePage();
    } else if (kIsWeb) {
      return const ImagePickerWebPage();
    } else {
      return Container();
    }
  }
}

//DropZoneWidget(onDroppedFile: (file) => setState(() => this.file = file))

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets_not_working/models/image_data_model.dart';
// import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets_not_working/drop_image_file.dart';
// import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets_not_working/drop_zone_image_web.dart';

// class ImageSearcherWidget extends StatefulWidget {
//   const ImageSearcherWidget({super.key});

//   @override
//   State<ImageSearcherWidget> createState() => _ImageSearcherWidgetState();
// }

// class _ImageSearcherWidgetState extends State<ImageSearcherWidget> {
//   ImageDataModel? file;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         kIsWeb
//             ? DropZoneWidget(
//                 onDroppedFile: (file) => setState(() => this.file = file))
//             : Container(),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: DroppedFileWidget(file: file),
//         ),
//       ],
//     );
//   }
// }
