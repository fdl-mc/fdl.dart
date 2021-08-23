part of fdl_api;

/// Provides all REST endpoints of the FDL API.
class _RestEndpoints {
  _RestEndpoints(String baseUrl) : _clinet = _RestClient(baseUrl);

  final _RestClient _clinet;

  /// Gets main server stats.
  Future<ServerStats> getMainServerStats() async {
    final res = await _clinet.get('/stats/main');
    return ServerStats._new(res.body);
  }

  /// Processes payment.
  Future<PaymentResponse> pay(PaymentBuilder paymentQuery) async {
    final res = await _clinet.get(
      '/economy/pay',
      parameters: paymentQuery.build(),
    );
    return PaymentResponse._new(res.body, hasError: res.statusCode != 200);
  }
}
