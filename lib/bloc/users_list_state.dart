part of 'users_list_bloc.dart';

@immutable
abstract class UsersListState {}

class UsersListInitial extends UsersListState {}

class UsersListLoaded extends UsersListState {
  UsersListLoaded(this.users);
  final List<UserModel> users;
}

class UsersListError extends UsersListState {}
