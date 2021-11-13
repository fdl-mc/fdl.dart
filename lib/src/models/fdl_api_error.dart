part of fdl_api;

class FdlApiError extends Error {
  final int statusCode;

  FdlApiError._new(this.statusCode);

  @override
  String toString() => 'FDL API error: $statusCode';
}

class UnauthorizedError extends FdlApiError {
  UnauthorizedError._new(int statusCode) : super._new(statusCode);
}

class UserNotFoundError extends FdlApiError {
  UserNotFoundError._new(int statusCode) : super._new(statusCode);
}

class CannotPayToYourselfError extends FdlApiError {
  CannotPayToYourselfError._new(int statusCode) : super._new(statusCode);
}

class InsuffuicientFundsError extends FdlApiError {
  InsuffuicientFundsError._new(int statusCode) : super._new(statusCode);
}

class NoTokenProvidedError extends FdlApiError {
  NoTokenProvidedError._new(int statusCode) : super._new(statusCode);
}
