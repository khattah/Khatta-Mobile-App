import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/screens/home/package_details_invitaion.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';

class SubscripeWithLink extends StatelessWidget {
  SubscripeWithLink({Key key}) : super(key: key);
  String _link = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).intro_slider_title3),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        // width: double.infinity,
        // color: Colors.blue,
        child: Container(
          // width: 200,
          child: appButton(S.of(context).subscribe.toUpperCase(), onpress: () {
            if (_link.isEmpty) {
              // CustomToast().showToast("الرجاء ادخال رابط الاشتراك");
              CustomToast().showToast(S.current.subscribe_link_enter);
              return;
            }
            if (!_link.contains("=")) {
              // CustomToast().showToast("الرجاء ادخال رابط اشتراك صحيح");
              CustomToast().showToast(S.current.subscribe_link_valid);
              return;
            }
            var code = _link.split("=")[1];

            Navigator.of(context).push(NavSlideFromRight(
                page: InvitationPackageDetails(invitationId: code)));
          }),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              // keyboardType: TextInputType.,
              minLines: 10,
              maxLines: 10,
              onChanged: (String value) {
                _link = value;
              },
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(15.0),
                labelText: S.current.subscribe_link,

                alignLabelWithHint: true,
                hintText:S.current.subscribe_link_past,
                // prefixIcon: Icon(Icons.phone),
              ),
            )
          ],
        ),
      ),
    );
  }
}
