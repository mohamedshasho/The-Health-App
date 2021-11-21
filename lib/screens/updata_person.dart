import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/models/person.dart';
import 'package:thehealths/models/person_data.dart';

class UpDataPerson extends StatefulWidget {
  static const String id = 'UpDataPerson';

  @override
  _UpDataPersonState createState() => _UpDataPersonState();
}

class _UpDataPersonState extends State<UpDataPerson> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  SharedPreferences sh;
  String name;
  String age;
  String weight;
  String height;
  Future<void> getRef() async {
    sh = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getRef();
    super.initState();
  }

  @override
  void dispose() {
    // other dispose methods
    print('dispose');
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Consumer<PersonData>(
              builder: (context, personData, child) {
                final Person person = personData.person;
                name = person.name;
                age = person.age;
                weight = person.weight;
                height = person.height;
                _controller1.text = person.name;
                _controller2.text = person.age;
                _controller3.text = person.height;
                _controller4.text = person.weight;
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Hero(
                          tag: 'profile',
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/itemFood1.png'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _controller1,
                        keyboardType: TextInputType.text,
                        cursorColor: kGreenColor, //لون المؤشر
                        decoration:
                            kTextFieldDecoration.copyWith(labelText: 'Name'),
                        textInputAction: TextInputAction.next,
                        //الزر محتواه الذي يظهر ايقونته عند انتهاء كتابة
                        onEditingComplete: () => node.nextFocus(),
                        // Move focus to next
                        onChanged: (newText) {
                          name = newText;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _controller2,
                        keyboardType: TextInputType.number,
                        cursorColor: kGreenColor, //لون المؤشر
                        decoration:
                            kTextFieldDecoration.copyWith(labelText: 'Age'),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        onChanged: (v) {
                          age = v;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _controller3,
                        cursorColor: kGreenColor, //لون المؤشر
                        decoration:
                            kTextFieldDecoration.copyWith(labelText: 'Height'),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        onChanged: (v) {
                          height = v;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _controller4,
                          cursorColor: kGreenColor, //لون المؤشر
                          decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Weight'),
                          onChanged: (v) {
                            weight = v;
                          },
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () async {
                            await sh.setString('name', name);
                            await sh.setString('age', age);
                            await sh.setString('weight', weight);
                            await sh.setString('height', height);
                            Provider.of<PersonData>(context, listen: false)
                                .upDataPerson(
                                    name: name,
                                    age: age,
                                    weight: weight,
                                    height: height);
                            Navigator.pop(context);
                          }
                          // onSubmitted: (v) async {
                          //   //هي لزر الدون في الكيبورد
                          //   await sh.setString('name', name);
                          //   await sh.setString('age', age);
                          //   await sh.setString('weight', weight);
                          //   await sh.setString('height', height);
                          //   Provider.of<PersonData>(context, listen: false)
                          //       .upDataPerson(
                          //           name: name,
                          //           age: age,
                          //           weight: weight,
                          //           height: height);
                          //   Navigator.pop(context);
                          // },
                          ),
                    ),
                  ],
                );
              },
            ),
            Container(
              width: double.infinity,
              color: kGreenColor,
              child: FlatButton(
                onPressed: () async {
                  await sh.setString('name', name);
                  await sh.setString('age', age);
                  await sh.setString('weight', weight);
                  await sh.setString('height', height);
                  Provider.of<PersonData>(context, listen: false).upDataPerson(
                      name: name, age: age, weight: weight, height: height);
                  Navigator.pop(context);
                },
                child: Text(
                  'save',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
