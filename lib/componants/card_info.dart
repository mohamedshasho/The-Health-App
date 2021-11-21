import 'package:flutter/material.dart';

class CardsInfo extends StatelessWidget {
  final String title;
  final Function onPressed;
  CardsInfo({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 35,
            horizontal: MediaQuery.of(context).size.width / 8,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
