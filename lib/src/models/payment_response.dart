part of fdl_api;

/// Server response to transaction.
class Transaction {
  /// Payer ID.
  final String payer;

  /// Payee ID.
  final String payee;

  /// Amount of payed money.
  final int amount;

  /// Transaction comment.
  final String? comment;

  /// Transaction timestamp.
  final DateTime at;

  /// Is this transaction made by system?
  final bool isSystem;

  Transaction._new(RawApiMap raw)
      : payer = raw['payer'] as String,
        payee = raw['payee'] as String,
        amount = raw['amount'] as int,
        comment = raw['comment'] as String?,
        isSystem = raw['system'] as bool,
        at = DateTime.parse(raw['at'] as String);
}
