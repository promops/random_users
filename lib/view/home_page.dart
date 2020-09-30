import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_users/bloc/users_list_bloc.dart';
import 'package:random_users/models/user_model.dart';
import 'package:random_users/view/widgets/loading_indicator.dart';
import 'package:random_users/view/widgets/user_list_item.dart';

import 'error_page.dart';
import 'users_page_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollThreshold = 200.0;
  final _scrollController = ScrollController();
  Timer _debounce;

  @override
  void initState() {
    BlocProvider.of<UsersListBloc>(context).add(UsersFetchEvent());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      if (_debounce != null) _debounce.cancel();
      _debounce = Timer(Duration(milliseconds: 300),
          () => BlocProvider.of<UsersListBloc>(context).add(UsersFetchEvent()));
    }
  }

  void _showUsersPageView({@required List<UserModel> users, int index}) {
    showDialog(
        context: context,
        builder: (context) {
          return UsersPageView(users: users, index: index);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: BlocBuilder(
                cubit: BlocProvider.of<UsersListBloc>(context),
                builder: (BuildContext context, UsersListState state) {
                  if (state is UsersListLoaded) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.users.length
                            ? LoadingIndicator()
                            : UserListItem(
                                userModel: state.users[index],
                                onTap: () => _showUsersPageView(
                                    users: state.users, index: index),
                              );
                      },
                      itemCount: state.users.length + 1,
                    );
                  }

                  if (state is UsersListError) {
                    return ErrorPage(
                      onTap: () => BlocProvider.of<UsersListBloc>(context)
                          .add(UsersFetchEvent()),
                    );
                  }

                  return LoadingIndicator();
                })));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
