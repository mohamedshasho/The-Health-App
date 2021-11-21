import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/componants/round_icon_button.dart';
import 'package:thehealths/componants/text_info.dart';
import 'package:thehealths/componants/card_info.dart';
import 'package:thehealths/models/person.dart';
import 'package:thehealths/screens/home_page.dart';

class InfoPerson extends StatefulWidget {
  static const String id = 'InfoPerson';
  static SharedPreferences sharedPreferences;
  @override
  _InfoPersonState createState() => _InfoPersonState();
}

enum Gender { male, female }

class _InfoPersonState extends State<InfoPerson> {
  int steps = 1;
  var colorActive = kGreenColor;
  var colorInActive = Colors.white;
  String text;
  Gender gender;
  String genderSelected;
  String textSteps1;
  String textSteps2;

  _showMaterialDialog(String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("Enter your $title"),
        content: TextField(
          keyboardType:
              title == 'name' ? TextInputType.text : TextInputType.number,
          autofocus: true,
          onChanged: (value) {
            text = value;
          },
        ),
        actions: <Widget>[
          FlatButton(
            color: kLiteGreenColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              saveValue(title, text);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> saveValue(String kay, String value) async {
    InfoPerson.sharedPreferences = await SharedPreferences.getInstance();
    await InfoPerson.sharedPreferences.setString(kay, value);
  }

  Future<void> saveGender(String gender) async {
    await InfoPerson.sharedPreferences.setString('gender', gender);
  }

  void getSteps() {
    setState(() {
      switch (steps) {
        case 1:
          {
            textSteps1 = 'weight';
            textSteps2 = 'height';
            break;
          }
        case 2:
          {
            textSteps1 = 'name';
            textSteps2 = 'age';
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getSteps();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/background1.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextInfo(),
                  SizedBox(
                    height: 10,
                  ),
                  steps != 3
                      ? CardsInfo(
                          title: 'What is your current $textSteps1?',
                          onPressed: () {
                            _showMaterialDialog(textSteps1);
                          })
                      : FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: gender == Gender.male
                              ? colorActive
                              : colorInActive,
                          child: Text('Male ?'),
                          onPressed: () {
                            setState(() {
                              gender = Gender.male;
                              genderSelected = 'male';
                              saveGender(genderSelected);
                            });
                          },
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  steps != 3
                      ? CardsInfo(
                          title: 'What is your current $textSteps2?',
                          onPressed: () {
                            _showMaterialDialog(textSteps2);
                          },
                        )
                      : FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: gender == Gender.female
                              ? colorActive
                              : colorInActive,
                          child: Text('Female ?'),
                          onPressed: () {
                            setState(() {
                              gender = Gender.female;
                              genderSelected = 'female';
                              saveGender(genderSelected);
                            });
                          },
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            '$steps/3 steps',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: kTextHintColor),
                          ),
                          onTap: () {},
                        ),
                        Column(
                          children: <Widget>[
                            RoundIconButton(
                              child: Icon(Icons.arrow_forward_ios),
                              size: 12,
                              onClick: () {
                                setState(() {
                                  steps == 3
                                      ? Navigator.pushNamedAndRemoveUntil(
                                          context, Home.id, (root) => false)
                                      : steps++;
                                });
                                //Navigator.pop(context);
                              },
                              color: kGreenColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            steps != 3
                                ? Text(
                                    'Next',
                                    style: TextStyle(color: Colors.black),
                                  )
                                : Text(
                                    'Start',
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // RoundIconButton(
            //   child: Icon(Icons.arrow_back_ios),
            //   onClick: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
