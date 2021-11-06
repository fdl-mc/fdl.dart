library fdl_api;

import 'package:http/http.dart' as http;
import 'dart:convert';

part 'src/fdl_api.dart';

// MODELS
part 'src/models/server_stats.dart';
part 'src/models/payment_response.dart';
part 'src/models/fdl_api_error.dart';
part 'src/models/user.dart';

/// CORE
part 'src/core/typedefs.dart';
part 'src/core/rest_endpoints.dart';
part 'src/core/http/_http_client.dart';
part 'src/core/http/_http_handler.dart';
part 'src/core/http/http_request.dart';
part 'src/core/http/http_response.dart';

// INTERFACES
part 'src/interfaces/builder.dart';

// BUILDERS
part 'src/builders/payment_builder.dart';
