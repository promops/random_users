import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_users/api/api_repository.dart';
import 'package:random_users/models/user_model.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final ApiRepository apiRepository;

  UsersListBloc(this.apiRepository) : super(UsersListInitial());

  @override
  Stream<UsersListState> mapEventToState(
    UsersListEvent event,
  ) async* {
    final currentState = state;

    if (event is UsersFetchEvent) {
      List<UserModel> users = [];
      if (currentState is UsersListLoaded) users = currentState.users;

      try {
        users += await apiRepository.getUserList(page: users.length ~/ 10);
        yield UsersListLoaded(users);
      } catch (e) {
        yield UsersListError();
      }
    }
  }
}
