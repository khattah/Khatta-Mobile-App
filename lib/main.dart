import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appStatusBarColor, statusBarBrightness: Brightness.dark
    //or set color with: Color(0xFF0000FF)
  ));

  //initial values
  final LanguageProvider lang = new LanguageProvider();
  final ProfileProvider profile = new ProfileProvider();
  await lang.setLocale();
  // timeago.setLocaleMessages(lang.code+"_short", timeago.DeMessages());
  Uri initialUri = await lang.initPlatformStateForStringUniLinks();
  final isAuth = await StorageHelper.get(StorageKeys.auth);
  print(".........................");
  print(isAuth);
  print(".........................");
  runApp(
    MyApp(
      lang: lang,
      initialUri: initialUri,
      isAuth: isAuth,
    ),
  );
}
// <!--        android:name="io.flutter.app.FlutterApplication"-->
// <!--        android:icon="@mipmap/ic_launcher"-->
// android:icon="@mipmap/ic_launcher"
// android:name="${applicationName}">