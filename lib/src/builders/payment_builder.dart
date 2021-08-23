part of fdl_api;

// Payment information builder.
class PaymentBuilder extends GetParametersBuilder {
  /// Payer (from).
  String? payer;

  /// Payee (to).
  String? payee;

  /// Amount of money.
  int? amount;

  PaymentBuilder({this.payer, this.payee, this.amount});

  /// Returns GET parameters map.
  @override
  Map<String, String> build() {
    return {
      'payer': payer!,
      'payee': payee!,
      'amount': amount!.toString(),
    };
  }
}
