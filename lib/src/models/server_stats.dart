part of fdl_api;

/// Server stats, eg. ip, latency, players info, etc.
class ServerStats {
  /// Server IP.
  late final String ip;

  /// Server port.
  late final int port;

  /// Server description.
  late final String desciption;

  /// Server version (ex. 1.17.1)
  late final String version;

  /// Server latency (in ms).
  late final int latency;

  /// Server players information.
  late final Players players;

  ServerStats._new(RawApiMap raw) {
    ip = raw['ip'] as String;
    port = raw['port'] as int;
    desciption = raw['desciption'] as String;
    version = raw['version'] as String;
    latency = raw['latency'] as int;
    players = Players._new(raw['players']);
  }
}

/// Server players stats.
class Players {
  /// Count of players currently on the server.
  late final int online;

  /// Maximum possible number of players.
  late final int max;

  /// List of names of players who are on the server.
  late final List<String> names;

  Players._new(RawApiMap raw) {
    online = raw['online'] as int;
    max = raw['max'] as int;
    names = List<String>.from(raw['names']);
  }
}
