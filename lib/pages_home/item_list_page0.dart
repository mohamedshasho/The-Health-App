import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thehealths/constants.dart';
import 'package:thehealths/componants/round_icon_button.dart';
import 'package:thehealths/widgets/circlar_item_info.dart';
import 'package:thehealths/componants/column_item_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemListPage0 extends StatelessWidget {
  SharedPreferences sharedPreferences;
  // Future<void> getDataShared() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   String d = sharedPreferences.getString('start');
  //   print(d);
  //   // لا يمكن الارجاع من فيوشر الافضل نخزن القيمة بمتحول خاارجي واسناد القيمة له بداخل دالة ست ستايت
  // }

  final String title;
  ItemListPage0({this.title});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.height / 60,
          ),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: <Widget>[
                                ColumnItemInfo(
                                  title: 'you have lost',
                                  size: '-2kg',
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 17,
                                ),
                                ColumnItemInfo(
                                  title: 'you have lost',
                                  size: 'Level 1',
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircularItemInfo(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Never give up,',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 2),
                        GestureDetector(
                          child: Text(
                            'know more.',
                            style: TextStyle(color: kGreenColor, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        RoundIconButton(
          child: Icon(Icons.arrow_forward),
          onClick: () {},
          color: kWhiteColor,
          size: 16,
        ),
      ],
    );
  }
}
