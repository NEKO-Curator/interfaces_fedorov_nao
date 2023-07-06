part of 'image_searcher_bloc.dart';

abstract class ImageSearcherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageUploadWebEvent extends ImageSearcherEvent {}
