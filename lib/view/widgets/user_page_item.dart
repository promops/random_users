import 'package:flutter/material.dart';
import 'package:random_users/models/user_model.dart';
import 'package:random_users/view/widgets/info_block.dart';

class UserPageItem extends StatelessWidget {
  final UserModel userModel;

  const UserPageItem({Key key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          right: 12,
          left: 12,
          top: AppBar().preferredSize.height,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
          child: Material(
              child: ListView(
            children: [

              Image.network(
                userModel.picture.large,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                  child: Text(
                    '${userModel.name.first} ${userModel.name.last}',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                  )),

               Container(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoBlock(
                      title: 'Address:',
                      subtitle:
                          '${userModel.location.country} ${userModel.location.state} ${userModel.location.city} ${userModel.location.street}',
                    ),
                    InfoBlock(
                      title: 'Email:',
                      subtitle: '${userModel.email}',
                    ),
                    InfoBlock(
                      title: 'Phone:',
                      subtitle: '${userModel.phone}',
                    )
                  ],
                ),
              )

            ],
          )),
        ));
  }
}


