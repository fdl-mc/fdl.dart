part of fdl_api;

class _RestClient {
  final Client _client;
  final String _baseUrl;
  String get baseUrl => _baseUrl;

  _RestClient(this._baseUrl) : _client = Client();

  Future<_RestClientResponse> get(
    String endpoint, {
    Map<String, String> parameters = const {},
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.get(
      Uri.https(baseUrl, endpoint, parameters),
      headers: headers,
    );
    // print(response.body);
    return _RestClientResponse(
      jsonDecode(response.body),
      statusCode: response.statusCode,
    );
  }

  Future<_RestClientResponse> post(
    String endpoint, {
    dynamic body,
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.post(
      Uri.https(baseUrl, endpoint),
      body: body,
      headers: headers,
    );
    return _RestClientResponse(
      jsonDecode(response.body),
      statusCode: response.statusCode,
    );
  }
}

class _RestClientResponse {
  final dynamic body;
  final int statusCode;

  _RestClientResponse(this.body, {required this.statusCode});
}
