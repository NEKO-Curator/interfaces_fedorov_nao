import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/bloc/image_searcher_bloc.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/links.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/presentation_constants.dart';

class ImageSearcherWidget extends StatefulWidget {
  const ImageSearcherWidget({super.key});

  @override
  State<ImageSearcherWidget> createState() => _ImageSearcherWidgetState();
}

class _ImageSearcherWidgetState extends State<ImageSearcherWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSearcherBloc, ImageSearcherState>(
      // bloc: ImageSearcherBloc(),
      builder: (context, state) {
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
                        context
                            .read<ImageSearcherBloc>()
                            .add(ImageUploadWebEvent());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state.status == ImageSearchStatus.success)
                    Column(
                      children: [
                        Image.memory(state.imageData!, width: 400, height: 400),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkWidget(state.url!),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
