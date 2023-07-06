// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
      var selectedFile = await startWebFilePicker();
      if (selectedFile == null) {
        // Обрабатываем ошибку, если файл не был выбран
        emit(state.copyWith(status: ImageSearchStatus.failure));
        return;
      }
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

  Future<List<int>?> startWebFilePicker() async {
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

    return completer.future;
  }
}
