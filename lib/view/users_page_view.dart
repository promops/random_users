import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_users/bloc/users_list_bloc.dart';

import 'package:random_users/models/user_model.dart';
import 'package:random_users/view/widgets/index_bar.dart';
import 'package:random_users/view/widgets/user_page_item.dart';

import 'error_page.dart';
import 'widgets/loading_indicator.dart';

class UsersPageView extends StatefulWidget {
  final List<UserModel> users;
  final int index;

  UsersPageView({
    Key key,
    @required this.users,
    @required this.index,
  }) : super(key: key);

  @override
  _UsersPageViewState createState() => _UsersPageViewState();
}

class _UsersPageViewState extends State<UsersPageView> {
  PageController _pageController;
  final _scrollThreshold = 200.0;
  int _currentIndex = 0;

  Timer _debounce;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.8);
    _currentIndex = widget.index;
    _pageController.addListener(_onScroll);
    _pageController.addListener(_changePageIndex);
  }

  void _changePageIndex() {
    if (_pageController.page.round() != _currentIndex)
      setState(() => _currentIndex = _pageController.page.round());
  }

  void _onScroll() {
    final maxScroll = _pageController.position.maxScrollExtent;
    final currentScroll = _pageController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      if (_debounce != null) _debounce.cancel();
      _debounce = Timer(Duration(milliseconds: 300),
          () => BlocProvider.of<UsersListBloc>(context).add(UsersFetchEvent()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: BlocBuilder(
            cubit: BlocProvider.of<UsersListBloc>(context),
            builder: (BuildContext context, UsersListState state) {
              if (state is UsersListLoaded) {
                return Column(
                  children: [
                    IndexBar(
                      title: '${_currentIndex + 1} из ${state.users.length}',
                    ),
                    Expanded(
                        child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.users.length
                            ? LoadingIndicator()
                            : UserPageItem(
                                userModel: state.users[index],
                              );
                      },
                      itemCount: state.users.length + 1,
                    )),
                  ],
                );
              }

              if (state is UsersListError) {
                return ErrorPage();
              }

              return LoadingIndicator();
            }));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
