import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularItemInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: MediaQuery.of(context).size.height / 13,
      lineWidth: 5.0,
      percent: 0.1,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "520",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            "Kcal",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      progressColor: Colors.green,
    );
  }
}
