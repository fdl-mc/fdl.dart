part of fdl_api;

class FdlApiError extends Error {
  final String status;
  final String message;

  FdlApiError._new(RawApiMap raw)
      : status = raw['errorStatus'] as String,
        message = raw['errorMsg'] as String;

  factory FdlApiError._resolve(RawApiMap raw) {
    switch (raw['errorMsg'] as String) {
      case 'USER_NOT_FOUND':
        return UserNotFoundError._new(raw);
      case 'INSUFFICIENT_FUNDS':
        return InsuffuicientFundsError._new(raw);
      case 'NO_TOKEN_PROVIDED':
        return NoTokenProvidedError._new(raw);
      case 'UNAUTHORIZED':
        return UnauthorizedError._new(raw);
      case 'NOT_ENOUGH_ARGS':
        return NotEnoughArgsError._new(raw);
      default:
        return FdlApiError._new(raw);
    }
  }

  @override
  String toString() => '$status: $message';
}

class UnauthorizedError extends FdlApiError {
  UnauthorizedError._new(RawApiMap raw) : super._new(raw);
}

class UserNotFoundError extends FdlApiError {
  UserNotFoundError._new(RawApiMap raw) : super._new(raw);
}

class InsuffuicientFundsError extends FdlApiError {
  InsuffuicientFundsError._new(RawApiMap raw) : super._new(raw);
}

class NoTokenProvidedError extends FdlApiError {
  NoTokenProvidedError._new(RawApiMap raw) : super._new(raw);
}

class NotEnoughArgsError extends FdlApiError {
  NotEnoughArgsError._new(RawApiMap raw) : super._new(raw);
}
