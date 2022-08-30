import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/app/app_linking.dart';
import 'package:jt_trading/src/app/testLink.dart';
import 'package:jt_trading/src/providers/base/int_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/home/package_details_invitaion.dart';
import 'package:jt_trading/src/screens/intro/intro_lag.dart';
import 'package:jt_trading/src/screens/intro/intro_slider.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../values/theme.dart';
import 'notifications.dart';

class MyApp extends StatelessWidget {
  final LanguageProvider lang;
  final Uri initialUri;
  final String isAuth;

  MyApp(
      {@required this.lang, @required this.initialUri, @required this.isAuth});
  @override
  Widget build(BuildContext context) {
    return InitProvider(
      lang: lang,
      child: Container(
        child: Consumer<LanguageProvider>(
          child: Container(),
          builder: (_, bloc, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (BuildContext context) =>
                  S.of(context).app_title,
              theme: AppTheme().themeData(context, lang.isArabic),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: bloc.appLocal,
              // home:IntroSliderPages());
              // home: IntroSliderPages(),
              home: appNavigate(),
              navigatorKey: navigatorKey,
            );
          },
        ),
      ),
    );
  }

  Widget appNavigate() {
    print("check .....${isAuth == null} ");
    // if(isAuth != null)Provider.of<ProfileProvider>(context).loadUserInfo();
    // if (initialUri != null && isAuth != null) return InvitationPackageDetails();
    // return isAuth == null ? IntroLang() : AppLinkingTest() ;
    return isAuth == null ? IntroLang() : AppLinking();

    // return isAuth == null ? IntroLang() : CustomListView(child: MainTabs(isAuth: isAuth,));dont forget login editing
  }
}
