import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/models/person.dart';
import 'package:thehealths/models/person_data.dart';
import 'package:thehealths/widgets/info_profile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background2.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Consumer<PersonData>(
            builder: (context, personData, child) {
              final Person person = personData.person;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 25,
                        color: kLiteBlackColor,
                      ),
                      backgroundColor: kGreenColor,
                      radius: 20,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/itemFood1.png'),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                //'name',
                                person.name ?? 'name',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        InfoProfile(
                          ontTitle: 'Height',
                          one: person.height ?? 'null',
                          towTitle: 'Weight',
                          tow: person.weight ?? 'null',
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        InfoProfile(
                          ontTitle: 'Age',
                          one: person.age ?? '0',
                          towTitle: 'Gender',
                          tow: person.gender ?? 'null',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Body mass index',
                                style: kTextInformationStyle,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Your Result',
                                textAlign: TextAlign.start,
                                style: kNumberTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            person.bmi.getResult() ?? 'result',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: kGreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            person.bmi.calculateBMI() ?? 'bmi',
                            textAlign: TextAlign.center,
                            style: kTextStyleBMI,
                          ),
                          Text(
                            person.bmi.getInterpretation() ?? 'pretation',
                            textAlign: TextAlign.center,
                            style: kTextStyleBMI,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
