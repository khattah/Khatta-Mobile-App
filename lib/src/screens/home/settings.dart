import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/screens/home/settings/widgets/setting_account_widget.dart';
import 'package:jt_trading/src/screens/home/settings/widgets/setting_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/logout_dialog.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _lunchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
        // forceWebView: true,
        // enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      child: ListView(
        // padding: EdgeInsets.all(appPadding),
        children: [
          SettingAccountWidget(),
          Divider(),
          // SizedBox(height: 1),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SettingWidgets.settingWidgetsWithContext(context).langItem(),
                // divider(),
                SettingWidgets().item(
                  Icons.help,
                  S.of(context).term_conditions,
                  onPress: () {
                    final bloc =
                        Provider.of<LanguageProvider>(context, listen: false);
                    _lunchUrl(
                      "https://khattah.com/${bloc.isArabic ? 'ar' : 'en'}/privacy",
                    );
                  },
                ),
                // divider(),
                // SettingWidgets().item(
                //   Icons.info_outline,
                //   S.of(context).about,
                //   onPress: () {
                //     _lunchUrl("http://khatta.com/em/privicy");
                //   },
                // ),
                // divider(),
                SettingWidgets().item(
                  Icons.logout,
                  S.of(context).logout,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LogoutDialog();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
