import 'package:flutter/material.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';

Widget appLogo({double width = 150, double height = 150}) {
  return Image.asset(
    "assets/logo.png",
    width: width,
    height: height,
  );
}

Widget appTextField({TextField textField, String label}) {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "$label",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        textField,
      ],
    ),
  );
}

Widget appCustomProgressIndicator({double strokeWidth=2}){
  return Theme(
    data: ThemeData(
      accentColor: appPrimaryColor,
    ),
    child: Container(
      child: CircularProgressIndicator(strokeWidth: strokeWidth,),
    ),
  );
}

Widget appButton(String text, {bool isPlane = false, Function onpress}) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 45,
      decoration: BoxDecoration(
          color: isPlane ? Colors.white : appPrimaryColor,
          border: Border.all(
            color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: isPlane ? appPrimaryColor : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    ),
  );
}
