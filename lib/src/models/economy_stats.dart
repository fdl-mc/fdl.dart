part of fdl_api;

class EconomyStats {
  final String userId;
  final int balance;

  EconomyStats._new(RawApiMap raw)
      : userId = raw['id'] as String,
        balance = raw['balance'] as int;
}
