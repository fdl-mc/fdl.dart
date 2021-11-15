part of fdl_api;

/// Generic FDL API interface.
/// Represends basic functionality that always available.
abstract class IFdlApi {
  Future<ServerStats> getMainServerStats();
  Future<ServerStats> getCreativeServerStats();
  Future<User> getUser(String id);
  Future<Iterable<User>> findUsers({String? nickname, String? discordId});
  Future<Transaction> pay(String token, TransactionBuilder paymentBuilder);
}

/// Main class for interacting with FDL API.
class FdlApi implements IFdlApi {
  final _HttpEndpoints _endpoints;
  FdlApi(String baseUrl, {bool isHttps = true})
      : _endpoints = _HttpEndpoints(baseUrl, isHttps);

  /// Get the main server statistics.
  @override
  Future<ServerStats> getMainServerStats() => _endpoints.getMainServerStats();

  /// Get the cretive server statistics.
  @override
  Future<ServerStats> getCreativeServerStats() =>
      _endpoints.getCreativeServerStats();

  @override
  Future<User> getUser(String id) => _endpoints.getUser(id);

  @override
  Future<Iterable<User>> findUsers({String? nickname, String? discordId}) =>
      _endpoints.findUsers(nickname: nickname, discordId: discordId);

  /// Process payment.
  @override
  Future<Transaction> pay(
    String token,
    TransactionBuilder paymentBuilder,
  ) =>
      _endpoints.pay(token, paymentBuilder);
}
