part of fdl_api;

class _HttpHandler {
  final _HttpClient _http;
  final String baseUrl;
  final bool isHttps;

  _HttpHandler(_client, this.baseUrl, this.isHttps) : _http = _HttpClient();

  Future<HttpResponse> execute(HttpRequest httpRequest) async =>
      _handle(await _http.execute(httpRequest));

  Future<HttpResponse> _handle(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpResponseSuccess._new(
        response.body.isEmpty
            ? null
            : jsonDecode(utf8.decode(response.bodyBytes)),
        statusCode: response.statusCode,
      );
    } else {
      return HttpResponseError._new(
        response.body.isEmpty
            ? null
            : jsonDecode(utf8.decode(response.bodyBytes)),
        statusCode: response.statusCode,
      );
    }
  }
}
