import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:uni_links/uni_links.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = Locale('en');
  Locale get appLocal => _appLocale ?? Locale("en");
  void setLocale() async {
    final code = await StorageHelper.get(StorageKeys.languageCode);
    if (code == null) {
      _appLocale = Locale('en');
      return;
    }
    _appLocale = Locale(code);

    _appLocale=Locale(code??"en");

//    _appLocale = Locale(code == null ? 'en' : code);
  }

  void changeLanguage(Locale locale) async {
    if (locale == Locale("ar")) {
      _appLocale = Locale("ar");
      StorageHelper.set(StorageKeys.languageCode, 'ar');
    } else {
      _appLocale = Locale("en");
      StorageHelper.set(StorageKeys.languageCode, 'en');
    }
    S.load(locale);
    notifyListeners();
  }

  bool get isArabic => appLocal == Locale('ar');
  String get code => appLocal.languageCode;

  Future<Uri> initPlatformStateForStringUniLinks() async {
    String initialLink;
    Uri initialUri;
    try {
      initialLink = await getInitialLink();
      print('initial link: $initialLink');
      if (initialLink != null) initialUri = Uri.parse(initialLink);
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
      initialUri = null;
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
      initialUri = null;
    }
    return initialUri;
  }
}
