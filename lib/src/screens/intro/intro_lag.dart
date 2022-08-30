import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/screens/intro/intro_slider.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class IntroLang extends StatefulWidget {
  @override
  _IntroLangState createState() => _IntroLangState();
}

class _IntroLangState extends State<IntroLang> {
  void _navigate(String langCode, String CountryCode) async {
    final bloc = Provider.of<LanguageProvider>(context, listen: false);
    bloc.changeLanguage(Locale(langCode));
    final view = await StorageHelper.get(StorageKeys.viewIntoSlider);
    if(view == null) {
      Navigator.of(context).push(
        NavSlideFromRight(
          // page:  Login(),
          page:  IntroSliderPages(),
        ),
      );
    }
    else{
      Navigator.of(context).pushReplacement(
        NavSlideFromRight(
          page:  Login(),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appLogo(),
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                "عيش وخلي الناس تعيش",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: appButton(
                    "تسجيل الدخول",
                    onpress: () {
                      _navigate("ar", "DZ");
                    },
                    isPlane: true,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: appButton(
                    "Sign In",
                    onpress: () {
                      _navigate("en", "US");
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
