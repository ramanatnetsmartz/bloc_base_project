import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../response/api_exception.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  // ignore: prefer_typing_uninitialized_variables
  http.Client client;

  NetworkApiService({required this.client});

  //For Post Api's
  @override
  Future postApiResponse(String url, dynamic data,
      {dynamic header,
      Map<String, dynamic>? queryParameters,
      FutureOr<http.Response> Function()? onTimeout}) async {
    dynamic responseJson;
    try {
      final response = await client
          .post(Uri.parse(url).replace(queryParameters: queryParameters),
              body: data, headers: header)
          .timeout(
            const Duration(seconds: 50),
            onTimeout: onTimeout,
          );
      debugPrint('''
      POST API Executed -->
      Status: ${response.statusCode} 
      Response: ${response.body}
      ''');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "No Internet Connection");
    }

    //if true then it'll return jso response
    return responseJson;
  }

  //For Get Api's
  @override
  Future getApiResponse(
    String url,
    // ignore: avoid_init_to_null
    {
    Map<String, String>? header,
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      final response = await client
          .get(Uri.parse(url).replace(queryParameters: queryParameters),
              headers: header)
          .timeout(const Duration(seconds: 20));
      debugPrint('''
      GET API Executed -->
      Status: ${response.statusCode} 
      Response: ${response.body}
      ''');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "No Internet Conection");
    }

    //if true then it'll return jso respose
    return responseJson;
  }


  dynamic returnResponse(response) {
    switch (response.statusCode) {
      case 200:
        if (response.body is Map<String, dynamic>) {
          return response.body;
        }
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        if (response.body is Map<String, dynamic>) {
          return response.body;
        }
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        // Get.context!.loaderOverlay.hide();
        // showSessionTimeout();
        return;
      case 500:
        if (response.body is Map<String, dynamic>) {
          return response.body;
        }
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        if (response.body is Map<String, dynamic>) {
          return response.body;
        }
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      // throw BadRequestException(message: response.body.toString());
      case 413:
        return {"Message": "FileSizeError", "Status": false, "Code": 413};
      default:
        throw FetchDataException(
            message:
                "Error occured while communicating with server with ctatus code${response.statusCode}");
    }
  }
}
