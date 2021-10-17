part of fdl_api;

class Passport {
  final String id;
  final String nickname;
  final String discordId;

  Passport._new(RawApiMap raw)
      // TODO: replace with _id after breaking change
      : id = raw['id'] as String,
        nickname = raw['nickname'],
        discordId = raw['discordId'];
}
