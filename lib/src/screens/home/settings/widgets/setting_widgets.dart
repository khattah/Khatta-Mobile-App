import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/screens/home/settings/change_language.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class SettingWidgets {
  BuildContext context;

  SettingWidgets();
  SettingWidgets.settingWidgetsWithContext(BuildContext context) {
    this.context = context;
  }

  Widget divider() {
    final bloc = Provider.of<LanguageProvider>(context, listen: false);
    return Container(
      child: Divider(color: Colors.white, thickness: 1, height: 4),
      margin: EdgeInsets.only(
          bottom: 20,
          left: bloc.isArabic ? 0 : 35,
          right: bloc.isArabic ? 35 : 0),
    );
  }

  Widget langItem() {
    final bloc = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          NavSlideFromRight(
            page: ChangeLanguage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: appPrimaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  S.of(context).language,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Text(bloc.isArabic ? "العربية" : "English",
                style: TextStyle(fontSize: 12, color: appPrimaryColor)),
          ],
        ),
      ),
    );
  }

  Widget item(IconData iconData, String title, {Function onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              iconData,
              color: appPrimaryColor,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
