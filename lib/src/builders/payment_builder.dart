part of fdl_api;

class PaymentBuilder extends Builder<RawApiMap> {
  String? payer;
  String? payee;
  int? amount;

  PaymentBuilder({this.payer, this.payee, this.amount});

  @override
  RawApiMap build() {
    return {
      'payer': payer!,
      'payee': payee!,
      'amount': amount!,
    };
  }
}
