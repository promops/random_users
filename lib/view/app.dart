import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_users/api/api_repository.dart';
import 'package:random_users/bloc/users_list_bloc.dart';

import 'home_page.dart';

class App extends StatelessWidget {
  final ApiRepository apiRepository;

  const App({Key key, this.apiRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UsersListBloc(apiRepository),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage()));
  }
}
