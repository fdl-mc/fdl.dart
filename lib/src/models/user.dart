part of fdl_api;

class User {
  final String id;
  final String nickname;
  final String discordId;
  final int balance;
  final DateTime createdAt;

  User._new(RawApiMap raw)
      : id = raw['id'] as String,
        nickname = raw['nickname'],
        discordId = raw['discord_id'],
        balance = raw['balance'],
        createdAt = DateTime.parse(raw['created_at']);
}
