import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/home.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/home/payment/buy/pay_cash.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  final SubscribePackageModel subscriptionModel;
  Payment(this.subscriptionModel);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  PackageProvider _packageProvider;
  void _lunchUrl(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(
        url,
        // forceWebView: true,
        // enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  // void _doPayment() async {
  //   bool check =
  //       await _packageProvider.buySubscribeToPackage(widget.packageModel.id);
  //   if (check) {
  //     _paymentDone();
  //   }
  // }
  //
  // _paymentDone() {
  //   Future.delayed(Duration(seconds: 2), () {
  //     Navigator.of(context)
  //         .pushReplacement(NavSlideFromRight(page: MainTabs()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return AppProcessModal(
      inAsyncCall: _packageProvider.packageLoader,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).payment),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(20),
          // width: double.infinity,
          // color: Colors.blue,
          child: Container(
            // width: 200,
            child:
                appButton(S.of(context).pay_Later.toUpperCase(), onpress: () {
              Navigator.of(context)
                  .pushReplacement(NavSlideFromRight(page: MainTabs()));
            }),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _payWidget(
                        iconData: Icons.payment,
                        label: S.of(context).pay_noqod,
                        backgroundColor: Color(0xcce4f2fd),
                        onPress: () {
                          _lunchUrl(widget.subscriptionModel.paymentUrl);
                          // CustomToast().showToast("جاري العمل عليها ..");
                        }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _payWidget(
                        iconData: Icons.monetization_on_sharp,
                        label: S.of(context).pay_cash,
                        backgroundColor: Color(0x15003d86),
                        onPress: () {
                          Navigator.of(context).push(NavSlideFromRight(
                              page: CashPayment(
                            orderId: widget.subscriptionModel.orderId,
                          )));
                        }),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Droid Arabic Kufi',
                      fontSize: 16,
                      color: Color(0xff555568),
                    ),
                    children: [
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          // fontSize: 16,
                          color: Colors.redAccent,
                        ),
                      ),
                      TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text:
                            "النظام يقبل البطاقات من جميع البنوك ما عدا ( بنك الخرطوم ، السلام ، البركة ، فيصل ، و بنك امدرمان الوطني )",
                        // style: TextStyle(
                        //   fontWeight: FontWeight.w700,
                        // ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  // textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _payWidget(
      {String label,
      IconData iconData,
      Color backgroundColor,
      Function onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundColor,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Icon(
              iconData,
              size: 60,
              color: appPrimaryColor,
            ),
            SizedBox(height: 20),
            Text(
              "$label",
              style: TextStyle(
                fontFamily: 'Droid Arabic Kufi',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
