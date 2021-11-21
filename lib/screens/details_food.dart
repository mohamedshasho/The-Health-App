import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/componants/round_icon_button.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/models/person_data.dart';
import 'package:thehealths/widgets/card_details.dart';
import 'package:thehealths/models/info_food.dart';

class DetailsFood extends StatelessWidget {
  DetailsFood({@required this.food});
  static const String id = 'DetailsFood';
  final InfoFood food;

//   @override
//   _DetailsFoodState createState() => _DetailsFoodState();
// }
//
// class _DetailsFoodState extends State<DetailsFood> {
//   SharedPreferences sh;
//   @override
//   void initState() {
//     getRef();
//     super.initState();
//   }
//
//   Future<void> getRef() async {
//     sh = await SharedPreferences.getInstance();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image:
                        AssetImage('images/${food.type}/item${food.index}.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                child: Stack(
                  //alignment: Alignment.topCenter,
                  //  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage(
                          'images/backitem.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                      height: MediaQuery.of(context).size.height / 5,
                      width: double.infinity,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RoundIconButton(
                            child: Icon(Icons.arrow_back),
                            color: Colors.white,
                            size: 16,
                            onClick: () {
                              Navigator.pop(context);
                            },
                          ),
                          Consumer<PersonData>(
                            builder: (context, personData, child) {
                              final favorite =
                                  personData.getFavorite(food.name);
                              List<String> foods = personData.favorite;
                              return RoundIconButton(
                                size: 20,
                                child: Icon(
                                  favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                color: Colors.white,
                                onClick: () async {
                                  SharedPreferences sh =
                                      await SharedPreferences.getInstance();
                                  if (favorite) {
                                    foods.remove(food.name);
                                    sh.setStringList('list', foods);
                                  } else {
                                    foods.add(food.name);
                                    sh.setStringList('list', foods);
                                  }
                                  personData.upDataFavorite();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kDarkGreenColor),
                  ),
                  Text(
                    '------------------------------------------',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                padding: EdgeInsets.all(10),
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Information',
                        textAlign: TextAlign.center,
                        style: kTextInformationStyle,
                      ),
                    ),
                  ),
                  CardDetails(
                    title: food.type == 'sports' ? 'Benefits' : 'Ingredients',
                    text: food.ingredients,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: kLiteBlackColor,
                    height: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CardDetails(
                    title: food.type == 'sports' ? 'Notes' : 'Preparation',
                    text: food.preparation,
                  ),
                  Container(
                    color: kLiteBlackColor,
                    height: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
