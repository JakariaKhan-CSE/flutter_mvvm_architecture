class AppException implements Exception {
  final _message;
  final _prefix;
// [ ] means not mandatory this constructor
  AppException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  // The : super(...) calls the parent class's constructor.
  //It passes message as _message and the string "Error During Communication" as _prefix to the parent class constructor.
  FetchDataException([String? message]):super(message, "Error During Communication");
}

class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message, "Invalid request");
}

class UnauthorizedException extends AppException{
  UnauthorizedException([String? message]):super(message, "Unauthorized request");
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]):super(message, "Invalid Input");
}