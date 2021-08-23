part of fdl_api;

class _RestClient {
  final Client _client;
  final String _baseUrl;
  String get baseUrl => _baseUrl;

  _RestClient(this._baseUrl) : _client = Client();

  Future<dynamic> get(
    String endpoint, {
    Map<String, String> parameters = const {},
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.get(
      Uri.https(baseUrl, endpoint, parameters),
      headers: headers,
    );
    // print(response.body);
    return jsonDecode(response.body);
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.post(
      Uri.https(baseUrl, endpoint),
      body: body,
      headers: headers,
    );
    return jsonDecode(response.body);
  }
}
