import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/componants/round_icon_button.dart';
import 'package:thehealths/data/data_dinner.dart';
import 'package:thehealths/models/info_food.dart';
import 'package:thehealths/models/person_data.dart';
import 'package:thehealths/screens/details_food.dart';

class ImageItemsFood extends StatelessWidget {
  final InfoFood food;
  ImageItemsFood({this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/${food.type}/item${food.index}.jpg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RoundIconButton(
              child: Icon(Icons.arrow_forward),
              size: 16,
              onClick: () {
                Provider.of<PersonData>(context, listen: false)
                    .loadDataSports();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsFood(
                      food: food,
                    ),
                  ),
                );
              },
              color: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
