import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/pages_start/swiper_page.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(seconds: 2),
      );
      //start new screen
      // Navigator.pop(context);
      // Navigator.pushNamed(context, SwipePage.id);
      isStart();
    });
  }

  Future<void> isStart() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('start') == 'start') {
      Navigator.pushNamedAndRemoveUntil(context, Home.id, (root) => false);
    } else {
      sharedPreferences.setString('start', 'start');
      Navigator.pushNamed(context, SwipePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/splashscreen.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
