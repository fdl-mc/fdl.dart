part of fdl_api;

class PaymentBuilder extends GetParametersBuilder {
  String? payer;
  String? payee;
  int? amount;

  PaymentBuilder({this.payer, this.payee, this.amount});

  @override
  Map<String, String> build() {
    return {
      'payer': payer!,
      'payee': payee!,
      'amount': amount!.toString(),
    };
  }
}
