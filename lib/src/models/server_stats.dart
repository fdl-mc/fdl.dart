part of fdl_api;

class ServerStats {
  late final String ip;
  late final int port;
  late final String desciption;
  late final String version;
  late final int latency;
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

class Players {
  late final int online;
  late final int max;
  late final List<String> names;

  Players._new(RawApiMap raw) {
    online = raw['online'] as int;
    max = raw['max'] as int;
    names = List<String>.from(raw['names']);
  }
}
