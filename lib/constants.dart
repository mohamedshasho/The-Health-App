import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFF4F5FA);
const kWhiteColor = Color(0xFFFFFFFF);
const kTextHintColor = Color(0xFFA2B8A6);
const kLiteGreenColor = Color(0xFF6CC57C);
const kLiteAlphaGreenColor = Color(0x556CC57C);
const kGreenColor = Color(0xFF61D27C);
const kDarkGreenColor = Color(0xFF6EB847);
const kLiteBlackColor = Color(0xFF054C02);
const kDarkBlackColor = Color(0x99000000);

const kBottomContainerColor = Color(0xFF342356);
const kTextCardDetailsColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);

const kLabelStyleText = TextStyle(
  fontSize: 18,
  color: kTextHintColor,
);
const kNumberTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkBlackColor,
  fontWeight: FontWeight.w900, //الساماكة خط من 100 ل 900
);
const kTextStyleBMI = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.w900, //الساماكة خط من 100 ل 900
);
const kLargeButtonTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const kTextInformationStyle = TextStyle(
    color: kGreenColor,
    fontSize: 20,
    letterSpacing: 1,
    fontWeight: FontWeight.w900);

const kTextFieldDecoration = InputDecoration(
  labelText: 'Value', //default
  labelStyle: TextStyle(fontSize: 18, color: kTextHintColor),
  //hintText: 'Enter your value', //نص افتراضي اذا ما ستعملنا كوبي في كل استدعاء
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreenColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    //فوكس يعني خصائص عند تحديد المربع يظهرو حطينا الويدث اكبر شان يبين انو تحدد ونفس اللون
    borderSide: BorderSide(color: kDarkGreenColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kTextStyleFavorite = TextStyle(
  color: kLiteBlackColor,
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
