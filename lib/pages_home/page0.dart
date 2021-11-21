import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:thehealths/constants.dart';
import 'package:intl/intl.dart';
import 'package:thehealths/data/data_breakfast.dart';
import 'package:thehealths/data/data_dinner.dart';
import 'package:thehealths/data/data_foods.dart';
import 'package:thehealths/data/data_sports.dart';
import 'package:thehealths/models/info_food.dart';
import 'package:thehealths/pages_home/item_list_page0.dart';
import 'package:thehealths/widgets/item_row_foods.dart';
import 'package:thehealths/widgets/item_swiper_food.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'FirstPage';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum activeColor { breakfast, dinner, foods, sports }

class _HomeScreenState extends State<HomeScreen> {
  activeColor checkColor = activeColor.breakfast;
  bool color = false;
  String type = 'breakfast';
  int indexFood = 0;
  int countItem = breakFast.length;
  SwiperController controller;
  List text = breakFast;
  List ingredients = ingredientsBreakfast;
  List preparation = preparationBreakfast;
  String selectCurrency = 'Activity';

  DropdownButtonHideUnderline androidDropdown() {
    return DropdownButtonHideUnderline(
      //اخفاء الخط
      child: DropdownButton(
        style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        value: selectCurrency,
        onChanged: (value) {
          setState(() {
            selectCurrency = value;
          });
        },
        items: [
          DropdownMenuItem(
            value: 'Activity',
            child: Text(
              'Activity',
            ),
          ),
          DropdownMenuItem(
            value: 'Activity2',
            child: Text(
              'Activity2',
            ),
          ),
          DropdownMenuItem(
            value: 'Activity3',
            child: Text(
              'Activity3',
            ),
          ),
        ],
      ),
    );
  }

  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = SwiperController();
    super.initState();
  }

  void setType(String name, int count, activeColor ck) {
    checkColor = ck;
    setState(() {
      // await controller.move(0);
      //حصرا اوايت لاني في انتظار يوصل ل اول عنصر انتبه في فيوتشر الاعادة
      type = name;
      countItem = count;

      switch (type) {
        case 'dinner':
          {
            text = dinner;
            ingredients = ingredientsDinner;
            preparation = preparationDinner;
            break;
          }
        case 'breakfast':
          {
            text = breakFast;
            ingredients = ingredientsBreakfast;
            preparation = preparationBreakfast;
            break;
          }
        case 'foods':
          {
            text = foods;
            ingredients = ingredientsFoods;
            preparation = preparationFoods;
            break;
          }
        case 'sports':
          {
            text = sports;
            ingredients = benefits;
            preparation = notes;
            break;
          }
      }
      indexFood = 0;
      goToFirst();
    });
  }

  void goToFirst() async {
    await controller.move(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background2.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: androidDropdown(),
                  ),
                  Text('Today, ' + getDate()),
                ],
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 5, left: 6, right: 6),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemListPage0(
                      title: 'Result of the week',
                    ),
                    ItemListPage0(
                      title: 'Your Information',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ItemRowFoods(
                      color: checkColor == activeColor.breakfast
                          ? kDarkGreenColor
                          : kGreenColor,
                      text: 'Breakfast',
                      onClick: () {
                        setType('breakfast', breakFast.length,
                            activeColor.breakfast);
                      },
                    ),
                    ItemRowFoods(
                      color: checkColor == activeColor.foods
                          ? kDarkGreenColor
                          : kGreenColor,
                      text: 'Foods',
                      onClick: () {
                        setType('foods', foods.length, activeColor.foods);
                      },
                    ),
                    ItemRowFoods(
                      color: checkColor == activeColor.dinner
                          ? kDarkGreenColor
                          : kGreenColor,
                      text: 'Dinner',
                      onClick: () {
                        setType('dinner', dinner.length, activeColor.dinner);
                      },
                    ),
                    ItemRowFoods(
                      color: checkColor == activeColor.sports
                          ? kDarkGreenColor
                          : kGreenColor,
                      text: 'Sports',
                      onClick: () {
                        setType('sports', sports.length, activeColor.sports);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: buildSwiper(),
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 40),
                child: Text(
                  text[indexFood],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kLiteBlackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Swiper buildSwiper() {
    return Swiper(
      loop: false,
      duration: 200,
      controller: controller,
      itemCount: countItem,
      autoplay: true,
      itemBuilder: (context, index) {
        return ImageItemsFood(
          food: InfoFood(
              index: index,
              type: type,
              name: text[indexFood],
              ingredients: ingredients[indexFood],
              preparation: preparation[indexFood]),
        );
      },
      onIndexChanged: (v) {
        setState(() {
          indexFood = v;
          //خطا تاني مرة نضع النص البرا لاني اذا يوجد عناصر كتير في كل تحريك رح يعمل اعادة تحميل للشاشة
        });
      },
      scale: 0.6,
      viewportFraction: 0.6,
    );
  }
}
