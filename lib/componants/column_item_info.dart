import 'package:flutter/material.dart';
import 'package:thehealths/constants.dart';

class ColumnItemInfo extends StatelessWidget {
  ColumnItemInfo({this.title, this.size});
  final String title;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 10),
        ),
        Text(size,
            style:
                TextStyle(color: kLiteGreenColor, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
