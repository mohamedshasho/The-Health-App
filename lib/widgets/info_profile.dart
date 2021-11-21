import 'package:flutter/material.dart';

class InfoProfile extends StatelessWidget {
  final String ontTitle;
  final String towTitle;
  final String one;
  final String tow;
  InfoProfile({this.one, this.ontTitle, this.tow, this.towTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.black54,
          height: 1,
        ),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(ontTitle),
                  SizedBox(
                    height: 5,
                  ),
                  Text(one),
                ],
              ),
              Container(
                color: Colors.black54,
                width: 1,
                height: MediaQuery.of(context).size.height / 25,
              ),
              Column(
                children: <Widget>[
                  Text(towTitle),
                  SizedBox(
                    height: 5,
                  ),
                  Text(tow),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.black54,
          height: 1,
        ),
      ],
    );
  }
}
