import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/models/info_food.dart';
import 'package:thehealths/models/person_data.dart';
import 'package:thehealths/widgets/item_swiper_food.dart';

class FavoriteScreen extends StatelessWidget {
  static const String id = 'FavoriteScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background2.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Your Favorites',
                  textAlign: TextAlign.center,
                  style: kLargeButtonTextStyle,
                ),
                Text(
                  'Your favorite foods',
                  style: kTextStyleFavorite,
                ),
                Expanded(
                  child: Consumer<PersonData>(
                    builder: (context, personData, child) {
                      return buildSwiper(type: personData.food);
                    },
                  ),
                ),
                Text(
                  'Your favorite sports ',
                  style: kTextStyleFavorite,
                ),
                Expanded(
                  child: Consumer<PersonData>(
                    builder: (context, personData, child) {
                      return buildSwiper(type: personData.sport);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Swiper buildSwiper({List<InfoFood> type}) {
    return Swiper(
      loop: false,
      duration: 200,
      itemCount: type.length,
      autoplay: true,
      itemBuilder: (context, index) {
        return ImageItemsFood(food: type[index]);
      },
      scale: 0.6,
      viewportFraction: 0.6,
    );
  }
}
