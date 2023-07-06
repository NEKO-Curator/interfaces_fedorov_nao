part of 'image_searcher_bloc.dart';

enum ImageSearchStatus { initial, loading, success, failure }

class ImageSearcherState extends Equatable {
  final ImageSearchStatus status;
  final String? url;
  final Uint8List? imageData;

  const ImageSearcherState({
    this.url,
    this.imageData,
    this.status = ImageSearchStatus.initial,
  });

  ImageSearcherState copyWith({
    ImageSearchStatus? status,
    String? url,
    Uint8List? imageData,
  }) {
    return ImageSearcherState(
      status: status ?? this.status,
      url: url ?? this.url,
      imageData: imageData ?? this.imageData,
    );
  }

  @override
  String toString() {
    return 'ImageSearcherState(status: $status, url: $url, data: ${_formatData(imageData)})';
  }

  String _formatData(Uint8List? data) {
    if (data == null) return 'null';
    if (data.length <= 10) return data.toString();
    return '[${data.sublist(0, 10)}... (total ${data.length} items)]';
  }

  @override
  List<Object?> get props => [status, url, imageData];
}
