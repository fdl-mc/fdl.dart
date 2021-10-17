part of fdl_api;

// Payment information builder.
class TransactionBuilder extends Builder<RawApiMap> {
  /// Transaction comment message.
  String? comment;

  /// Amount of money.
  int amount;

  TransactionBuilder({this.comment, required this.amount});

  @override
  RawApiMap build() {
    return {
      if (comment != null) 'comment': comment!,
      'amount': amount,
    };
  }
}
