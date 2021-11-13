part of fdl_api;

/// Provides all REST endpoints of the FDL API.
class _HttpEndpoints {
  _HttpEndpoints(String baseUrl)
      : _handler = _HttpHandler(_HttpClient(), baseUrl);

  final _HttpHandler _handler;

  /// Get main server stats.
  Future<ServerStats> getMainServerStats() async {
    final res = await BasicRequest._new(_handler, '/stats/main').execute();
    return ServerStats._new(res.body);
  }

  /// Get creative server stats.
  Future<ServerStats> getCreativeServerStats() async {
    final res = await BasicRequest._new(_handler, '/stats/creative').execute();
    return ServerStats._new(res.body);
  }

  /// Get user by ID.
  Future<User> getUser(String id) async {
    final res = await BasicRequest._new(_handler, '/users/$id').execute();

    if (res.statusCode == 404) throw UserNotFoundError._new(404);
    return User._new(res.body);
  }

  /// Find users by query.
  Future<Iterable<User>> findUsers({
    String? nickname,
    String? discordId,
  }) async {
    final res = await BasicRequest._new(
      _handler,
      '/users/find',
      queryParameters: {
        if (nickname != null) 'nickname': nickname,
        if (discordId != null) 'discord_id': discordId,
      },
    ).execute();

    return (res.body as List<dynamic>).map(
      (e) => User._new(e as RawApiMap),
    );
  }

  /// Process payment.
  Future<Transaction> pay(String token, TransactionBuilder paymentQuery) async {
    final res = await BasicRequest._new(
      _handler,
      '/economy/pay',
      method: 'POST',
      headers: {'Authorization': token},
      body: paymentQuery.build(),
    ).execute();

    if (res.statusCode == 401) throw UnauthorizedError._new(401);
    if (res.statusCode == 400) throw CannotPayToYourselfError._new(400);
    if (res.statusCode == 403) throw InsuffuicientFundsError._new(403);
    return Transaction._new(res.body);
  }
}
