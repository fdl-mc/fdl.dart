part of fdl_api;

abstract class HttpRequest {
  http.Request toRequest();
}

class BasicRequest extends HttpRequest {
  final _HttpHandler _handler;
  final Uri _url;
  final String method;
  final RawApiMap? body;
  final RawApiMap? queryParameters;
  final Map<String, String>? headers;

  BasicRequest._new(
    this._handler,
    String endpoint, {
    this.method = 'GET',
    this.body,
    this.queryParameters,
    this.headers,
  }) : _url = _handler.isHttps
            ? Uri.https(_handler.baseUrl, endpoint, queryParameters)
            : Uri.http(_handler.baseUrl, endpoint, queryParameters);

  @override
  http.Request toRequest() {
    final req = http.Request(method, _url);

    if (body != null) req.body = jsonEncode(body);
    req.headers.addAll({
      'User-Agent': 'fdl_api',
      'Content-Type': 'application/json',
    });
    if (headers != null) req.headers.addAll(headers!);

    return req;
  }

  // we do a little shortcutting
  Future<HttpResponse> execute() => _handler.execute(this);
}
