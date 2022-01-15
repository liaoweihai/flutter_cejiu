import 'package:http/http.dart' as http;

const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

class AppApiClient {
  final http.Client httpClient;
  AppApiClient({required this.httpClient});

  factory AppApiClient.getApiClient() {
    return AppApiClient(httpClient: http.Client());
  }

  getAll() async {
    try {
      var response = await httpClient.get(Uri());
      if (response.statusCode == 200) {}
    } catch (_) {}
  }

  getId(id) async {
    try {
      var response = await httpClient.get(Uri());
      if (response.statusCode == 200) {}
    } catch (_) {}
  }
}
