import 'package:flutter/cupertino.dart';

class Sizes {
  static double mediaHeight(
      {required BuildContext context, required double height}) {
    return MediaQuery.sizeOf(context).height * height;
  }

  static double mediaWidth(
      {required BuildContext context, required double width}) {
    return MediaQuery.sizeOf(context).width * width;
  }

  static double minDesktopWidth = 600.0;
}
