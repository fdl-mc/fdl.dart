part of fdl_api;

/// Builder interface for GET parameters in presentation of map of strings.
abstract class GetParametersBuilder extends Builder<GetParametersMap> {
  @override
  Map<String, String> build();
}
