part of fdl_api;

class PaymentResponse {
  late final bool hasError;
  late final String message;

  PaymentResponse._new(RawApiMap raw, {required bool hasError}) {
    this.hasError = hasError;
    message = raw['message'] as String;
  }
}
