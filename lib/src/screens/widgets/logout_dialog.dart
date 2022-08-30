import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

import 'nav/nav_slide_from_right.dart';

class LogoutDialog extends StatefulWidget {
  @override
  _LogoutDialogState createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  void logout() {
    Provider.of<ProfileProvider>(context,listen: false).logout();

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,

      // elevation: 20,
      title: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(S.of(context).are_you_sure),
      ),
      actions: <Widget>[
        InkWell(
          child: FlatButton(
            color: appPrimaryColor,
            child: Text(
              S.of(context).yes,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              logout();
            },
          ),
        ),
        InkWell(
          child: FlatButton(
            color: Colors.black,
            child: Text(
              S.of(context).cancel,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[],
        ),
        // color: Colors.blue,
        // child:
      ),
    );
  }
}
