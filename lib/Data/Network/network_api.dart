import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:iqra360/Data/Network/base_api_services.dart';
import 'package:iqra360/Data/app_exception.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String? url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url!))
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      FetchDataException('no internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonEncode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        FetchDataException(
          'error oocure duraing communationwith status code${response.statusCode.toString()}',
        );
    }
  }
}
