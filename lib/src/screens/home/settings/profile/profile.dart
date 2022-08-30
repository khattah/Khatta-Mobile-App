import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/home/settings/profile/change_password.dart';
import 'package:jt_trading/src/screens/home/settings/profile/change_phone_number.dart';
import 'package:jt_trading/src/screens/home/settings/profile/edit_name.dart';
import 'package:jt_trading/src/screens/home/settings/profile/profile_image.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

import 'edit_card_number.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileProvider _profileProvider;
  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
      ),
      body: Container(
        child: CustomListView(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              ProfileImage(),
              _item(
                  title: S.of(context).name,
                  subtitle: _profileProvider.user.name,
                  iconData: Icons.person,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (ctx) {
                        return EditNameDialog();
                      },
                    );
                  }),
              _item(
                  title: S.of(context).card_id,
                  subtitle: _profileProvider.user.cardID.trim().isEmpty
                      ? S.current.not_added
                      : _profileProvider.user.cardID,
                  iconData: Icons.food_bank_outlined,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (ctx) {
                        return EditCartNumberDialog();
                      },
                    );
                  }),
              _item(
                title: S.of(context).phone,
                showEditBtn: false,
                subtitle: _profileProvider.user.phoneNumber,
                iconData: Icons.phone,
                // onTap: () {
                //   Navigator.of(context).push(
                //     NavSlideFromRight(
                //       page: ChangePhoneNumber(),
                //     ),
                //   );
                // },
              ),
              _item(
                  title: S.of(context).password,
                  subtitle: S.of(context).change_your_password,
                  iconData: Icons.lock_outline,
                  onTap: () {
                    Navigator.of(context).push(
                      NavSlideFromRight(
                        page: ChangePassword(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(
      {String title = "title",
      String subtitle = "subtitle",
      IconData iconData = Icons.help,
      Function onTap,
      bool showEditBtn = true}) {
    return Container(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: Colors.black,
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    textDirection: TextDirection.ltr,
                    // textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
        title: Text(title, style: TextStyle(fontSize: 14)),
        trailing: showEditBtn
            ? Icon(
                Icons.edit,
                color: appPrimaryColor,
              )
            : SizedBox(),
      ),
    );
  }
}
