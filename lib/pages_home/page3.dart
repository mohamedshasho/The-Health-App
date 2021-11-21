import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/models/person.dart';
import 'package:thehealths/models/person_data.dart';
import 'package:thehealths/screens/home_page.dart';
import 'package:thehealths/screens/info_person.dart';
import 'package:thehealths/screens/updata_person.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'SettingsScreen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SharedPreferences sh;
  @override
  void initState() {
    getRef();
    super.initState();
  }

  Future<void> getRef() async {
    sh = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background2.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Consumer<PersonData>(
                    builder: (context, personData, child) {
                      final Person person = personData.person;
                      return ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        title: Text(person.name ?? 'name'),
                        leading: Hero(
                          tag: 'profile',
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('images/itemFood1.png'),
                          ),
                        ),
                        trailing: GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: () {
                            //sh.setString('start', '');
                            Navigator.pushNamed(context, UpDataPerson.id);
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, InfoPerson.id, (root) => false);
                            // Route route = MaterialPageRoute(
                            //     builder: (context) => InfoPerson());
                            // Navigator.pushReplacement(context, route);
                          },
                        ),
                        subtitle:
                            Text('BMI: ${person.bmi.getResult() ?? 'nun=ll'}'),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ItemSetting(text: 'Account'),
                        ItemSetting(text: 'Notification'),
                        ItemSetting(text: 'Service'),
                        ItemSetting(text: 'Share'),
                        ItemSetting(text: 'Logout'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemSetting extends StatelessWidget {
  final String text;
  final Function onPressed;
  ItemSetting({@required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/$text.png'),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () {
        print(text);
      },
    );
  }
}
