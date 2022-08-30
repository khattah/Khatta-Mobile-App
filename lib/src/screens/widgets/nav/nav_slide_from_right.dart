import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:provider/provider.dart';

class NavSlideFromRight extends PageRouteBuilder {
  final Widget page;

  NavSlideFromRight({this.page})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return page;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          final bloc = Provider.of<LanguageProvider>(context, listen: false);
          return new SlideTransition(
            position: Tween<Offset>(
              // begin: Offset(1.0, 0.0),
              // end: Offset(0.0, 0.0),
              begin: !bloc.isArabic ? Offset(1.0, 0.0) : Offset(-1.0, 0.0),
              end: !bloc.isArabic ? Offset(0.0, 0.0) : Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        });
}
