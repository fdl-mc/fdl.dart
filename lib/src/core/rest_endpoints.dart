part of fdl_api;

/// Provides all REST endpoints of the FDL API.
class _RestEndpoints {
  _RestEndpoints(String baseUrl) : _clinet = _RestClient(baseUrl);

  final _RestClient _clinet;

  /// Gets main server stats.
  Future<ServerStats> getMainServerStats() async {
    final res = await _clinet.get('/v1/stats/main');
    return ServerStats._new(res.body);
  }

  /// Gets main server stats.
  Future<ServerStats> getCreativeServerStats() async {
    final res = await _clinet.get('/v1/stats/creative');
    return ServerStats._new(res.body);
  }

  /// Processes payment.
  Future<PaymentResponse> pay(PaymentBuilder paymentQuery) async {
    final res = await _clinet.post(
      '/v1/economy/pay',
      body: paymentQuery.build(),
    );
    return PaymentResponse._new(res.body);
  }
}
