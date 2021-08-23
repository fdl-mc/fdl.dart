part of fdl_api;

abstract class IFdlApi {
  Future<ServerStats> getMainServerStats();
  Future<PaymentResponse> pay(PaymentBuilder paymentBuilder);
}
