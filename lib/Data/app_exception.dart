class AppException implements Exception {
  AppException([this._message, this._perfix]);

  final dynamic _message;
  final dynamic _perfix;

  @override
  String toString() {
    return '$_message $_perfix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error during Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
    : super(message, 'UnAuthorized request');
}

class InPutException extends AppException {
  InPutException([String? message]) : super(message, 'Input Request');
}
