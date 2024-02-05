// ignore_for_file: unnecessary_string_interpolations
import 'package:http/http.dart' as http;
import '../network/network_api_services.dart';

class MiscRepository {
  // ignore: unused_field
  final NetworkApiService _apiService =
      NetworkApiService(client: http.Client());

  fetchList() async {}
}
