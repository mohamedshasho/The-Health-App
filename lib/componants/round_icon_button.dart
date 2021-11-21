import 'package:flutter/material.dart';
import 'package:thehealths/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.child,
      @required this.onClick,
      @required this.color,
      @required this.size});
  //لانه من اسمه يحتاج ضروري هل برامترين
  final Widget child;
  final Function onClick;
  final Color color;
  final int size;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick, child: child,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        //الخصائص جبناها من كلاس فلوتن باتن ليصبح نفس شكله
        //حجم الزر
        width: MediaQuery.of(context).size.height / size,
        height: MediaQuery.of(context).size.height / size,
      ),
      shape: CircleBorder(), //شكل الزر
      fillColor: color,
    );
  }
}
