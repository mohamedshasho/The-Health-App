import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/data/d_text.dart';
import 'package:thehealths/screens/home_page.dart';
import 'package:thehealths/screens/info_person.dart';

class SwipePage extends StatefulWidget {
  static const String id = 'swipepage';
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  PageController controller = PageController(initialPage: 0, keepPage: false);
  int index = 0;
  // Future<void> isStart() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString('start') == 'start') {
  //     Navigator.pushNamedAndRemoveUntil(context, Home.id, (root) => false);
  //   } else {
  //     sharedPreferences.setString('start', 'start');
  //   }
  // }

  // @override
  // void initState() {
  //   //isStart();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            controller: controller,
            itemCount: titles.length,
            itemBuilder: (BuildContext context, position) {
              return Container(
                decoration: BoxDecoration(color: kBackgroundColor),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Image(
                          image: AssetImage('images/p${position + 1}.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        titles[position],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        kTextStartPage[index],
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                dot(index, 0),
                SizedBox(width: 2),
                dot(index, 1),
                SizedBox(width: 2),
                dot(index, 2),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  index < 1 //تكون في اول صفحة صفر الشرط محقق يعرض زر التخطي
                      ? FlatButton(
                          onPressed: () => controller.animateToPage(
                              2, //عدد اخر صفحة
                              duration: Duration(
                                  milliseconds:
                                      150), //كم ثانية يتم الانتقال ببطء اذا القيمة اكتر
                              curve: Curves.linear),
                          child: Text('Skip'),
                        )
                      : SizedBox(),
                  index != 2 //طالما لم يوصل ل اخر صفحة لا يعرض زر البدء
                      ? FlatButton(
                          color: kGreenColor,
                          onPressed: () => controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear),
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: StadiumBorder(),
                        )
                      : FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, InfoPerson.id);
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(color: kLiteGreenColor),
                          ),
                          shape: StadiumBorder(),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget dot(index, i) {
  //الدوائر الصغار
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: index == i ? kLiteGreenColor : kLiteAlphaGreenColor,
    ),
  );
}
