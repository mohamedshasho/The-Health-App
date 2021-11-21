import 'package:flutter/material.dart';
import 'package:thehealths/constants.dart';

class ItemRowFoods extends StatelessWidget {
  final String text;
  final Function onClick;
  final Color color;
  ItemRowFoods({@required this.text, this.onClick, this.color});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onClick,
    );
  }
}
