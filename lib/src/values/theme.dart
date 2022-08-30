import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class AppTheme {
  ThemeData themeData(BuildContext context, bool isArabic) {
    return ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primaryColor: appPrimaryColor,
      primarySwatch: appPrimaryColor,
      // accentColor: appAccentColor,
      // accentColorBrightness: Brit,
      // scaffoldBackgroundColor: Colors.transparent,
      // scaffoldBackgroundColor: Colors.grey[20],

      // accentColor: appAccentColor,

      appBarTheme: AppBarTheme(
        elevation: 1,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,

        ),
        // textTheme: TextTheme(
        //   headline6: TextStyle(
        //       fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        //   headline5: TextStyle(
        //       fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        //   headline4: TextStyle(
        //       fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        centerTitle: true,
        brightness: Brightness.light,
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black45, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(isArabic ? 14 : 18),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: appPrimaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.black38)),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        suffixStyle: TextStyle(color: appPrimaryColor),
        prefixStyle: TextStyle(color: appPrimaryColor),
      ),

      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
