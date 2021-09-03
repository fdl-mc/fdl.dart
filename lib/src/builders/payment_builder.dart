part of fdl_api;

// Payment information builder.
class PaymentBuilder extends GetParametersBuilder {
  /// Payee (to).
  String? payee;

  /// Amount of money.
  int? amount;

  /// Transaction comment.
  String? comment;

  PaymentBuilder({this.payee, this.amount, this.comment});

  /// Returns GET parameters map.
  @override
  Map<String, String> build() {
    return {
      'payee': payee!,
      'amount': amount!.toString(),
      if (comment != null) 'comment': comment!
    };
  }
}
