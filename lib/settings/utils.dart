import 'package:flutter/cupertino.dart';

class Utils {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height / 815;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width / 375;
  }
}
