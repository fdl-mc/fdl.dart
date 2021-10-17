part of fdl_api;

class _HttpClient {
  final http.Client _innerClient;

  _HttpClient() : _innerClient = http.Client();

  Future<http.Response> execute(HttpRequest httpRequest) async {
    return await http.Response.fromStream(
      await _innerClient.send(httpRequest.toRequest()),
    );
  }
}
