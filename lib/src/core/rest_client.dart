part of fdl_api;

class _RestClient {
  final Client _client;
  final String _baseUrl;

  _RestClient(this._baseUrl) : _client = Client();

  /// Processes GET request
  Future<_RestClientResponse> get(
    String endpoint, {
    GetParametersMap? parameters,
    Map<String, String>? headers,
  }) async {
    final response = await _client.get(
      Uri.http(_baseUrl, endpoint, parameters),
      headers: headers,
    );
    // print(response.body);
    return _RestClientResponse(
      jsonDecode(utf8.decode(response.bodyBytes)),
      statusCode: response.statusCode,
    );
  }

  /// Processes POST request
  Future<_RestClientResponse> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await _client.post(
      Uri.http(_baseUrl, endpoint),
      body: body,
      headers: headers,
    );
    return _RestClientResponse(
      jsonDecode(utf8.decode(response.bodyBytes)),
      statusCode: response.statusCode,
    );
  }
}

class _RestClientResponse {
  final dynamic body;
  final int statusCode;

  _RestClientResponse(this.body, {required this.statusCode});
}
