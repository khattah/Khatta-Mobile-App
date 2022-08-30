import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:provider/provider.dart';

class InitProvider extends StatelessWidget {
  final Widget child;
  final LanguageProvider lang;
  const InitProvider({Key key, this.child, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => lang),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => PackageProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: child,
    );
  }
}
