// import 'package:flutter/material.dart';
// import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/image_picker_android.dart';

// class ImageSearcherPage extends StatelessWidget {
//   const ImageSearcherPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ImagePickerMobilePage();
//   }
// }

//DropZoneWidget(onDroppedFile: (file) => setState(() => this.file = file))

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/bloc/image_searcher_bloc.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/image_searcher_widget.dart';

class ImageSearcherPage extends StatefulWidget {
  const ImageSearcherPage({super.key});

  @override
  State<ImageSearcherPage> createState() => _ImageSearcherPageState();
}

class _ImageSearcherPageState extends State<ImageSearcherPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSearcherBloc(),
      child: const ImageSearcherWidget(),
    );
  }
}
