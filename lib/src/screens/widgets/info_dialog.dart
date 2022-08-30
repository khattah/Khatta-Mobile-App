import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';

class InfoDialog extends StatelessWidget {
  final Function() onPress;
  final String message;
  final String btnString;
  InfoDialog({this.onPress, this.message, this.btnString});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,

      // elevation: 20,
      content: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$message",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            InkWell(
              child: FlatButton(
                minWidth: 200,
                color: appPrimaryColor,
                child: Text(
                  btnString ?? S.of(context).sign_in,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  onPress();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
