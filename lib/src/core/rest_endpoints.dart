part of fdl_api;

/// Provides all REST endpoints of the FDL API.
class _HttpEndpoints {
  _HttpEndpoints(String baseUrl)
      : _handler = _HttpHandler(_HttpClient(), baseUrl);

  final _HttpHandler _handler;

  /// Get main server stats.
  Future<ServerStats> getMainServerStats() async {
    final res = await BasicRequest._new(_handler, '/v1/stats/main').execute();
    return ServerStats._new(res.body);
  }

  /// Get creative server stats.
  Future<ServerStats> getCreativeServerStats() async {
    final res =
        await BasicRequest._new(_handler, '/v1/stats/creative').execute();
    return ServerStats._new(res.body);
  }

  /// Get passport by ID.
  Future<Passport> getPassport(String id) async {
    final res = await BasicRequest._new(
      _handler,
      '/v1/passports/$id',
    ).execute();

    return Passport._new(res.body);
  }

  Future<EconomyStats> getUserEconomyStats(String id) async {
    final res = await BasicRequest._new(
      _handler,
      '/v1/economy/$id',
    ).execute();

    return EconomyStats._new(res.body);
  }

  /// Find passports by query.
  Future<Iterable<Passport>> findPassports(String query) async {
    final res = await BasicRequest._new(
      _handler,
      '/v1/passports/find',
      queryParameters: {'query': query},
    ).execute();

    return (res.body as List<dynamic>).map(
      (e) => Passport._new(e as RawApiMap),
    );
  }

  /// Process payment.
  Future<Transaction> pay(
    String token,
    String payerId,
    TransactionBuilder paymentQuery,
  ) async {
    final res = await BasicRequest._new(
      _handler,
      '/v1/economy/$payerId/pay',
      method: 'POST',
      body: paymentQuery.build(),
    ).execute();
    return Transaction._new(res.body);
  }
}
