part of fdl_api;

/// Generic FDL API interface.
/// Represends basic functionality that always available.
abstract class IFdlApi {
  Future<ServerStats> getMainServerStats();
  Future<ServerStats> getCreativeServerStats();
  Future<Passport> getPassport(String id);
  Future<EconomyStats> getUserEconomyStats(String id);
  Future<Iterable<Passport>> findPassports(String query);
  Future<Transaction> pay(
      String token, String id, TransactionBuilder paymentBuilder);
}

/// Main class for interacting with FDL API.
class FdlApi implements IFdlApi {
  final _HttpEndpoints _endpoints;
  FdlApi(String baseUrl) : _endpoints = _HttpEndpoints(baseUrl);

  /// Get the main server statistics.
  @override
  Future<ServerStats> getMainServerStats() => _endpoints.getMainServerStats();

  /// Get the cretive server statistics.
  @override
  Future<ServerStats> getCreativeServerStats() =>
      _endpoints.getCreativeServerStats();

  @override
  Future<Passport> getPassport(String id) => _endpoints.getPassport(id);

  @override
  Future<EconomyStats> getUserEconomyStats(String id) =>
      _endpoints.getUserEconomyStats(id);

  @override
  Future<Iterable<Passport>> findPassports(String query) =>
      _endpoints.findPassports(query);

  /// Process payment.
  @override
  Future<Transaction> pay(
    String token,
    String id,
    TransactionBuilder paymentBuilder,
  ) =>
      _endpoints.pay(token, id, paymentBuilder);
}
