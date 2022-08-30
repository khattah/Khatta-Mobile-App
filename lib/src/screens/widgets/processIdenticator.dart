import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AppProcessModal extends StatelessWidget {
  bool inAsyncCall;
  Widget child;
  AppProcessModal({this.child, this.inAsyncCall = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inAsyncCall,
        // dismissible: true,
        opacity: .3,
        // color: Colors.transparent,
        progressIndicator: Container(
          child: Container(
            width: 300,
            // height: 200,
            // margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Theme(
                    data: ThemeData(accentColor: Colors.red),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      // backgroundColor: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    S.of(context).please_wait,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
