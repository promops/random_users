import 'package:flutter/material.dart';

import 'package:random_users/models/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel userModel;
  final Function onTap;

  const UserListItem({
    Key key,
    @required this.userModel,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(userModel.picture.thumbnail),
      title: Text(userModel.name.first),
      subtitle: Text(
          '${userModel.location.country} ${userModel.location.state} ${userModel.location.city}'),
      onTap: this.onTap,
    );
  }
}
