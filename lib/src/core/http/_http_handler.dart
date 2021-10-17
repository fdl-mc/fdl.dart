part of fdl_api;

class _HttpHandler {
  final _HttpClient _http;
  final String baseUrl;

  _HttpHandler(_client, this.baseUrl) : _http = _HttpClient();

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
    }

    throw FdlApiError._resolve(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
