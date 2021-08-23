part of fdl_api;

abstract class IFdlApi {
  Future<ServerStats> getMainServerStats();
  Future<PaymentResponse> pay(PaymentBuilder paymentBuilder);
}

class FdlApi implements IFdlApi {
  final _RestEndpoints _endpoints;
  FdlApi(String baseUrl) : _endpoints = _RestEndpoints(baseUrl);

  @override
  Future<ServerStats> getMainServerStats() async {
    return await _endpoints.getMainServerStats();
  }

  @override
  Future<PaymentResponse> pay(PaymentBuilder paymentBuilder) async {
    return await _endpoints.pay(paymentBuilder);
  }
}
