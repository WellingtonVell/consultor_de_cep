class ApiException implements Exception {
  final String message;

  ApiException(this.message);
}

class BadRequestException extends ApiException {
  BadRequestException(String message) : super(message);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message);
}

class ServerErrorException extends ApiException {
  ServerErrorException(String message) : super(message);
}