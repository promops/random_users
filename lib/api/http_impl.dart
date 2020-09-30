import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:random_users/api/http.dart';

import 'exceptions.dart';

const baseUrl = 'randomuser.me';

class HttpImpl implements Http {
  Future<http.Response> get({
    Map<String, String> params,
  }) async {
    Uri uri = Uri.https(baseUrl, 'api', params);

    try {
      http.Response result = await http.get(uri);
      return result;
    } on SocketException catch (error) {
      throw OfflineException(error.message);
    } on HttpException catch (error) {
      throw ServerUnavailableException(error.message, error.uri);
    }
  }
}
