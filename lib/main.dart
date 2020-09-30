import 'package:flutter/material.dart';
import 'package:random_users/api/api_repository.dart';

import 'api/http_impl.dart';
import 'view/app.dart';

void main() async {
  ApiRepository apiRepository = ApiRepository(httpClient: HttpImpl());

  runApp(App(apiRepository: apiRepository));
}
