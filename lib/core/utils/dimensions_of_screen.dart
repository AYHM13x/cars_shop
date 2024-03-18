import 'package:flutter/material.dart';

class DimensionsOfScreen {
  static double dimensionsOfWidth(BuildContext context, double percent) {
    return MediaQuery.sizeOf(context).width * percent / 100;
    //return MediaQuery.of(context).size.width * percent / 100;
  }

  static double dimensionsOfHeight(BuildContext context, double percent) {
    return MediaQuery.sizeOf(context).height * percent / 100;
    //return MediaQuery.of(context).size.height * percent / 100;
  }

  static double getScreenRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }
}

double responciveHeight(BuildContext context) {
  if (DimensionsOfScreen.getScreenRatio(context) == 1.75) {
    return DimensionsOfScreen.dimensionsOfHeight(context, 29.9);
  } else if (DimensionsOfScreen.getScreenRatio(context) == 2.75) {
    return DimensionsOfScreen.dimensionsOfHeight(context, 44.1);
  } else {
    return DimensionsOfScreen.dimensionsOfHeight(context, 44.9);
  }
}
