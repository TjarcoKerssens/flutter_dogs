import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final apiClientProvider = Provider((ref) => DogsAPIClient());

/// A simple service that actually connects to the Dogs API.
/// By centralizing this in a seperate service, we avoid having repositories
/// that need knowledge about the API base. This case is trivial, but usually
/// one would also manage authentication etc. in this service class
class DogsAPIClient {
  final _httpClient = Client();
  Future<Response> get(String endpoint) {
    return _httpClient.get(Uri.https(_domain, "$_apiPath/$endpoint"));
  }
}

const _domain = "dog.ceo";
const _apiPath = "/api";
