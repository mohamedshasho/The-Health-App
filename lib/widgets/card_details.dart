import 'package:flutter/material.dart';
import 'package:thehealths/constants.dart';

class CardDetails extends StatelessWidget {
  CardDetails({this.text, this.title});
  //final InfoFood food;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: TextStyle(
                letterSpacing: 0.5,
                wordSpacing: 2,
                fontSize: 15,
                color: kTextCardDetailsColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
