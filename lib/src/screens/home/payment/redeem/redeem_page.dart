import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/screens/home/home.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:jt_trading/src/values/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class RedeemPackagePage extends StatelessWidget {
  final String orderId;
  RedeemPackagePage({this.orderId});
  makeCall(String mobile) async {
    String url = "tel:$mobile";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).redeem_reward),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        // width: double.infinity,
        // color: Colors.blue,
        child: Container(
          // width: 200,
          child: appButton(S.of(context).back.toUpperCase(), onpress: () {
            Navigator.of(context)
                .pushReplacement(NavSlideFromRight(page: MainTabs()));
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            RichText(
              text: TextSpan(
                text: S.current.customer_service_info_message_redeem,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: ' #$orderId ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent)),
                ],
              ),
            ),
            // Text(
            //   "الرجاء التواصل مع خدمة العملاء لاتمام عملة الدفع نقدا للشتراك الخاص بالباقة رقم #082347 ",
            //   style: TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            SizedBox(height: 20),
            ...List.generate(
              customerServicePhoneNumbers.length,
              (index) => ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Wrap(
                  children: [
                    Text(
                      "${customerServicePhoneNumbers[index]}",
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
                // title: Wrap(
                //   children: [
                //     Text("+"),
                //     Text("${customerServicePhoneNumbers[index]}"),
                //   ],
                // ),
                subtitle: Text(S.of(context).customer_service_number),
                trailing: FloatingActionButton(
                  mini: true,
                  heroTag: "tag$index",
                  backgroundColor: appPrimaryColor,
                  child: Icon(Icons.phone),
                  onPressed: () {
                    makeCall("${customerServicePhoneNumbers[index]}");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
