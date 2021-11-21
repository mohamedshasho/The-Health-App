import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextInfo extends StatelessWidget {
  //List<String> txt = ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TyperAnimatedTextKit(
          text: ["Let's do your diet,"],
          speed: Duration(milliseconds: 200),
          textStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'for you',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 40,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
