import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random_users/api/http.dart';
import 'package:random_users/models/user_model.dart';

class ApiRepository {
  final Http httpClient;
  ApiRepository({@required this.httpClient});

  Future<List<UserModel>> getUserList(
      {int page = 1, int resultsCount = 10}) async {
    final result = await httpClient.get(
        params: {'results': '$resultsCount', 'seed': 'oleg', 'page': '$page'});

    List<UserModel> users = [];

    var data = json.decode(result.body)['results'];

    data.forEach((user) => users.add(UserModel.fromMap(user)));

    return users;
  }
}
