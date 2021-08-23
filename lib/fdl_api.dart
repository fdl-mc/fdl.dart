library fdl_api;

import 'package:http/http.dart' show Client;
import 'dart:convert' show jsonDecode, utf8;

part 'src/fdl_api.dart';

// MODELS
part 'src/models/server_stats.dart';
part 'src/models/payment_response.dart';

/// CORE
part 'src/core/typedefs.dart';
part 'src/core/rest_client.dart';
part 'src/core/rest_endpoints.dart';

// INTERFACES
part 'src/interfaces/builder.dart';
part 'src/interfaces/get_parameters_builder.dart';

// BUILDERS
part 'src/builders/payment_builder.dart';
