// ignore_for_file: prefer_typing_uninitialized_variables

class ApiExceptions implements Exception {
  ApiExceptions([this._message, this._prefix]);
  final _message;
  final _prefix;

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

//If we can't communicate with the network then this will throw ann exception after a certain time
class FetchDataException extends ApiExceptions {
  FetchDataException({String? message})
      : super(message, "Error During Communication");
}

//If the BaseUrl is wrong and if the api is not available
class BadRequestException extends ApiExceptions {
  BadRequestException({String? message}) : super(message, "Ivalid Request");
}

//While doing signup/ login we get a token which validate that user has this app access/ data access
class UnAuthorizedException extends ApiExceptions {
  UnAuthorizedException({String? message})
      : super(message, "Unauthorized request");
}

class InvalidInputException extends ApiExceptions {
  InvalidInputException({String? message}) : super(message, "Invalid Input");
}
