part of fdl_api;

class _RestEndpoints {
  _RestEndpoints(this._base_url) : _clinet = _RestClient(_base_url);

  final String _base_url;
  final _RestClient _clinet;

  Future<ServerStats> getMainServerStats() async {
    final res = await _clinet.get('/stats/main');
    return ServerStats._new(res.body);
  }

  Future<PaymentResponse> pay(PaymentBuilder paymentQuery) async {
    final res = await _clinet.get(
      '/stats/main',
      parameters: paymentQuery.build(),
    );
    return PaymentResponse._new(res.body, hasError: res.statusCode != 200);
  }
}
