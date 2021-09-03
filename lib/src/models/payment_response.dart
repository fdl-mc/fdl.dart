part of fdl_api;

/// Server response to transaction.
class PaymentResponse {
  /// Message from the sever.
  late final String message;

  PaymentResponse._new(RawApiMap raw) {
    message = raw['message'] as String;
  }
}
