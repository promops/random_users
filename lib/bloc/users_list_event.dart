part of 'users_list_bloc.dart';

@immutable
abstract class UsersListEvent {}

class UsersFetchEvent extends UsersListEvent {
  UsersFetchEvent();
}
