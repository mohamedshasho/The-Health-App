import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:thehealths/pages_home/page0.dart';
import 'package:thehealths/pages_home/page1.dart';
import 'package:thehealths/pages_home/page2.dart';
import 'package:thehealths/pages_home/page3.dart';
import 'package:provider/provider.dart';
import 'package:thehealths/models/person_data.dart';

class Home extends StatefulWidget {
  static const String id = 'homePage';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController;
  String name;
  @override
  void initState() {
    super.initState();
    // getRef();
    _pageController = PageController();
  }

  // Future<void> getRef() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   print('getRef in home');
  //   Provider.of<PersonData>(context, listen: false).loadDataSports();
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('reLode'); //لتستدعي كتير غير الخطة
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            ProfileScreen(),
            FavoriteScreen(),
            SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.bounceIn,
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        }),
        items: [
          getNavItem(
            text: 'Home',
            icon: Icon(
              Icons.home,
              color: kBottomContainerColor,
            ),
          ),
          getNavItem(
            text: 'Profile',
            icon: Icon(
              Icons.person,
              color: kBottomContainerColor,
            ),
          ),
          getNavItem(
            text: 'Favorites',
            icon: Icon(
              Icons.favorite,
              color: kBottomContainerColor,
            ),
          ),
          getNavItem(
            text: 'Settings',
            icon: Icon(
              Icons.settings,
              color: kBottomContainerColor,
            ),
          ),
        ],
      ),
    );
  }
}

BottomNavyBarItem getNavItem({String text, Icon icon}) {
  return BottomNavyBarItem(
    icon: icon,
    title: Text(
      text,
      style: TextStyle(color: kTextHintColor),
    ),
    activeColor: kGreenColor,
    inactiveColor: kLiteGreenColor,
  );
}
