part of fdl_api;

/// Server response to transaction.
class PaymentResponse {
  /// True if the transaction is successful.
  late final bool hasError;

  /// Message from the sever.
  late final String message;

  PaymentResponse._new(RawApiMap raw, {required bool hasError}) {
    this.hasError = hasError;
    message = raw['message'] as String;
  }
}
