import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/screens/home/payment/buy/payment.dart';
import 'package:jt_trading/src/screens/home/payment/redeem/redeem_page.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:jt_trading/src/utils/app_methods.dart';
import 'package:share/share.dart';

class ActivePackageDetails extends StatefulWidget {
  SubscribePackageModel activePackage;
  ActivePackageDetails({this.activePackage});
  @override
  _ActivePackageDetailsState createState() => _ActivePackageDetailsState();
}

class _ActivePackageDetailsState extends State<ActivePackageDetails> {
  void _sendInvitation() {
    // Share.share('https://khata.com/share/package_invitation/?invitaion_code=88420c3963cc350dfcbd50749eec1832',
    Share.share(
        'https://khattah.com/package/invitation/?invitaion_code=${widget.activePackage.id}',
        subject: "invitation link");
  }

  void _redeemReward() {
    // Navigator.of(context).push(NavSlideFromRight(page: RedeemPackagePage()));
    // bool check = await _packageProvider.buyPackage(widget.packageModel.id);
    // if (check) {
    //   Navigator.of(context).push(NavSlideFromRight(page: Payment()));
    // }
    // print
    Navigator.of(context).push(NavSlideFromRight(
        page: RedeemPackagePage(
      orderId: widget.activePackage.id,
    )));
  }

  void _navToPayment() {
    Navigator.of(context)
        .push(NavSlideFromRight(page: Payment(widget.activePackage)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).active_packages),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(20),
          // width: double.infinity,

          // color: Colors.blue,
          child: appButton(
            !widget.activePackage.paymentStatus
                ? S.of(context).pay
                : widget.activePackage.isActive
                    ? S.of(context).send_invitations
                    : S.of(context).redeem_reward,
            onpress: () {
              !widget.activePackage.paymentStatus
                  ? _navToPayment()
                  : widget.activePackage.isActive
                      ? _sendInvitation()
                      : _redeemReward();
            },
          ),
          // child: appButton(
          //   widget.activePackage.isActive
          //       ? S.of(context).send_invitations
          //       : S.of(context).redeem_reward,
          //   onpress: () {
          //     widget.activePackage.isActive
          //         ? _sendInvitation()
          //         : _redeemReward();
          //   },
          // ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomListView(
          child: ListView(
            children: [
              packageDetailsHeader(
                context,
                packageModel: widget.activePackage.package,
                state: widget.activePackage.subscribeState,
                cardData: Row(
                  children: [
                    cardItemInfo(S.of(context).you_give,
                        "${currencyFormat(widget.activePackage.fees)}"),
                    cardItemSeparator(),
                    cardItemInfo(S.of(context).you_earn,
                        "${currencyFormat(widget.activePackage.total)}"),
                  ],
                ),
              ),
              referralsWidget(widget.activePackage.subscribers,
                  widget.activePackage.subscribersNo),

              // packageDescription(widget.activePackage.package.description),
            ],
          ),
        ),
      ),
    );
  }
}
