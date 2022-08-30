import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatelessWidget {
  _launchStore() async {
    SystemNavigator.pop();
    //   await clearAllSharedValue();
    // isLoggedIn = false;
    String url =
        "http://play.google.com/store/apps/details?id=com.fatish.sdecommerce";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WillPopScope(
        onWillPop: () {
          return;
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Text(S.of(context).update_app),
          actions: <Widget>[
            Container(
              child: FlatButton(
                color: Colors.black,
                child: Text(
                 S.of(context).close_app.toUpperCase(),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ),
            Container(
              child: FlatButton(
                color: Colors.green,
                child: Text(
                 S.of(context).update_now.toUpperCase(),
//                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  _launchStore();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
          content: Container(
            padding: EdgeInsets.all(25),
            child: Text(
              S.of(context).update_message,
            ),
            // color: Colors.blue,
            // child:
          ),
        ),
      ),
    );
  }
}
