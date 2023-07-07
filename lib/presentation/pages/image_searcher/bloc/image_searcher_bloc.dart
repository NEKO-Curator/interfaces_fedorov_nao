// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:interfaces_fedorov_coursework_nao/data/datasources/image_picker/image_picker_stub.dart'
    if (dart.library.io) 'package:interfaces_fedorov_coursework_nao/data/datasources/image_picker/image_picker_android.dart'
    if (dart.library.html) 'package:interfaces_fedorov_coursework_nao/data/datasources/image_picker/image_picker_web.dart';
import 'package:interfaces_fedorov_coursework_nao/data/datasources/image_searcher_remote.dart';

part 'image_searcher_event.dart';
part 'image_searcher_state.dart';

class ImageSearcherBloc extends Bloc<ImageSearcherEvent, ImageSearcherState> {
  ImageSearcherBloc() : super(const ImageSearcherState()) {
    on<ImageUploadWebEvent>((event, emit) async {
      await _onImageSearchWeb(event, emit);
    });
  }
  Future<void> _onImageSearchWeb(
      ImageUploadWebEvent event, Emitter<ImageSearcherState> emit) async {
    try {
      // if (state.status == ImageSearchStatus.initial ||
      //     state.status == ImageSearchStatus.success) {
      List<int> selectedFile;
      if (kIsWeb) {
        selectedFile = await ImagePickerImpl().pickImage();
      } else {
        selectedFile = await ImagePickerImpl().pickImage();
      }
      // if (selectedFile == null) {
      //   // Обрабатываем ошибку, если файл не был выбран
      //   emit(state.copyWith(status: ImageSearchStatus.failure));
      //   return;
      // }
      emit(state.copyWith(status: ImageSearchStatus.loading));
      String url = await ImageSearcherRemoteDataImpl()
          .uploadImageAndSearchWeb(selectedFile);
      emit(
        state.copyWith(
          status: ImageSearchStatus.success,
          url: url,
          imageData: Uint8List.fromList(selectedFile),
        ),
      );
      // }
    } catch (_) {
      emit(state.copyWith(status: ImageSearchStatus.failure));
    }
  }
}
