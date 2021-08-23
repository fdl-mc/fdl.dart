part of fdl_api;

/// Generic FDL API interface.
/// Represends basic functionality that always available.
abstract class IFdlApi {
  Future<ServerStats> getMainServerStats();
  Future<PaymentResponse> pay(PaymentBuilder paymentBuilder);
}

/// Main class for interacting with FDL API.
class FdlApi implements IFdlApi {
  final _RestEndpoints _endpoints;
  FdlApi(String baseUrl) : _endpoints = _RestEndpoints(baseUrl);

  /// Gets the main server statistics.
  @override
  Future<ServerStats> getMainServerStats() async {
    return await _endpoints.getMainServerStats();
  }

  /// Processes payment.
  @override
  Future<PaymentResponse> pay(PaymentBuilder paymentBuilder) async {
    return await _endpoints.pay(paymentBuilder);
  }
}
