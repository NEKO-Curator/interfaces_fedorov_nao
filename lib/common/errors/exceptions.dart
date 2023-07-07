class ServerException implements Exception {
  final String cause;
  ServerException(this.cause);
}

class ParsingException implements Exception {
  final String cause;
  ParsingException(this.cause);
}

class PickerException implements Exception {
  final String cause;
  PickerException(this.cause);
}
