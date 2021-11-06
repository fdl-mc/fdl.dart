part of fdl_api;

// Payment information builder.
class TransactionBuilder extends Builder<RawApiMap> {
  /// Transaction comment message.
  String? comment;

  /// Amount of money.
  int amount;

  /// Payment reciever.
  String payee;

  TransactionBuilder({this.comment, required this.amount, required this.payee});

  @override
  RawApiMap build() {
    return {
      if (comment != null) 'comment': comment!,
      'payee': payee,
      'amount': amount,
    };
  }
}
