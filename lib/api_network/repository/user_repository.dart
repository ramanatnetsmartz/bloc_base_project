import 'package:flutter/material.dart';
import '../network/network_api_services.dart';
import 'package:http/http.dart' as http;
class UserRepository {
  // ignore: unused_field
  final NetworkApiService _apiService = NetworkApiService(client: http.Client());

  fetchUserDetails(String username, String password) async {
    String url = "LOGIN_URL";
    final parameters = {"username": "$username", "password": "$password"};
    debugPrint("Sending User Detail Request -->");
    final response = await _apiService.postApiResponse(
      url,
      null,
      queryParameters: parameters,
    );
    // LoginResponse details = LoginResponse.fromJson(response);
    //return details;
  }
}
