import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Function onTap;

  const ErrorPage({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Произошла ошибка'),
        FlatButton(
            onPressed: onTap,
            child: Text(
              'Повторить',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
      ],
    ));
  }
}
