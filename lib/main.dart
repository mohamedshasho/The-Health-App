import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thehealths/models/person_data.dart';
import 'package:thehealths/pages_home/page0.dart';
import 'package:thehealths/pages_home/page1.dart';
import 'package:thehealths/pages_home/page2.dart';
import 'package:thehealths/pages_home/page3.dart';
import 'package:thehealths/pages_start/swiper_page.dart';
import 'package:thehealths/screens/home_page.dart';
import 'package:thehealths/screens/info_person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/screens/splash_screen.dart';
import 'package:thehealths/screens/updata_person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences sh;
  @override
  void initState() {
    getRef();
    print('main initState');
    super.initState();
  }

  Future<void> getRef() async {
    sh = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonData(sh),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Oregano'),
        initialRoute: SplashScreen.id,
        routes: {
          SwipePage.id: (context) => SwipePage(),
          InfoPerson.id: (context) => InfoPerson(),
          Home.id: (context) => Home(),
          UpDataPerson.id: (context) => UpDataPerson(),
          SplashScreen.id: (context) => SplashScreen()
        },
      ),
    );
  }
}
