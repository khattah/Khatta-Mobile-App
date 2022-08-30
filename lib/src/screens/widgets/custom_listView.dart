import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  Widget child;
  CustomListView({@required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      //this for remove list view scroll glow color
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: child,
    );
  }
}
