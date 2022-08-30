import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  ProfileProvider _profileProvider;
  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);
    return AppProcessModal(
      inAsyncCall: _profileProvider.loading,
      child: Scaffold(
        // resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text(S.of(context).choose_language),
          elevation: 1,
        ),
        body: Container(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Center(
      child: FutureBuilder<String>(
        initialData: "en",
        future: StorageHelper.get(StorageKeys.languageCode),
        builder: (context, snapshot) {
          return CustomListView(
            child: ListView(
              children: <Widget>[
                ListTile(
                  trailing: snapshot.data != "ar"
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    update("en");
                  },
                  title: Text(
                    "English",
                    style: TextStyle(),
                  ),
                ),
                Divider(color: Colors.grey[200], thickness: 1, height: 4),
                ListTile(
                  onTap: () {
                    update("ar");
                  },
                  title: Text(
                    "العربية",
                    style: TextStyle(),
                  ),
                  trailing: snapshot.data == "ar"
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void update(String code) async {
    bool check = await _profileProvider.updateProfileInfo({"lang": code});
    if (check) {
      final bloc = Provider.of<LanguageProvider>(context, listen: false);
      bloc.changeLanguage(Locale(code));
    }
  }
}
