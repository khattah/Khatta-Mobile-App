import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PackageDetailsTheme extends StatelessWidget {
  Widget child;
  PackageDetailsTheme({@required this.child});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.orange[600],
        statusBarBrightness: Brightness.light
        //or set color with: Color(0xFF0000FF)
        ));
    return Theme(
      data: ThemeData(
        primaryColor: Colors.orange[600],
        appBarTheme: AppBarTheme(
          elevation: .5,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
            headline6: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      child: child,
    );
  }
}
