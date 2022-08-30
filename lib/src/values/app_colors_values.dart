import 'dart:math';

import 'package:flutter/material.dart';

//values
final navigatorKey = GlobalKey<NavigatorState>();
final BuildContext appContext = GlobalKey<NavigatorState>().currentContext;
double appPadding = 16.0;

//Colors
Color appPrimaryColor = Colors.deepOrange;
Color appAccentColor = Colors.black;
Color appStatusBarColor = Colors.white;

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
