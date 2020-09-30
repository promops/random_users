import 'package:flutter/material.dart';

class IndexBar extends StatelessWidget {
  final String title;

  const IndexBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Expanded(
              flex: 1,
              child: Container(),
            ),

            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    height: AppBar().preferredSize.height,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).accentColor),
                        )))),

            Expanded(
                flex: 1,
                child: InkWell(
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () => Navigator.pop(context),
                ))

          ],
        ));
  }
}
