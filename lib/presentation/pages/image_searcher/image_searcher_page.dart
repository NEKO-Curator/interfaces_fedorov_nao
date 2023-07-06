// import 'package:flutter/material.dart';
// import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/image_picker_android.dart';

// class ImageSearcherWidget extends StatelessWidget {
//   const ImageSearcherWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ImagePickerMobilePage();
//   }
// }

//DropZoneWidget(onDroppedFile: (file) => setState(() => this.file = file))

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/bloc/image_searcher_bloc.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/image_picker_web.dart';

class ImageSearcherWidget extends StatefulWidget {
  const ImageSearcherWidget({super.key});

  @override
  State<ImageSearcherWidget> createState() => _ImageSearcherWidgetState();
}

class _ImageSearcherWidgetState extends State<ImageSearcherWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSearcherBloc(),
      child: kIsWeb ? const ImagePickerWebPage() : Container(),
    );
  }
}
