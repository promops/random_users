import 'dart:io';

class OfflineException extends HttpException {
  OfflineException(String message, [Uri uri]) : super(message, uri: uri);

  @override
  String toString() => 'offline';
}

class ServerUnavailableException extends HttpException {
  ServerUnavailableException(String message, [Uri uri])
      : super(message, uri: uri);

  @override
  String toString() => 'unavailable';
}
