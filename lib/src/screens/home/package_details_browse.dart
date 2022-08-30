import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/home/payment/buy/payment.dart';
import 'package:jt_trading/src/screens/home/settings/widgets/buy_package_dialog.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/utils/app_methods.dart';
import 'package:provider/provider.dart';

class BrowsePackageDetails extends StatefulWidget {
  PackageModel packageModel;
  BrowsePackageDetails({this.packageModel});

  @override
  _BrowsePackageDetailsState createState() => _BrowsePackageDetailsState();
}

class _BrowsePackageDetailsState extends State<BrowsePackageDetails> {
  PackageProvider _packageProvider;

  void _doSubscription() async {
    SubscribePackageModel check =
        await _packageProvider.buySubscribeToPackage(widget.packageModel.id);
    if (check != null) {
      _subscriptionDone(check);
    }
    // _subscriptionDone();
  }

  _subscriptionDone(SubscribePackageModel subscribePackageModel) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .push(NavSlideFromRight(page: Payment(subscribePackageModel)));
    });
  }

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return AppProcessModal(
      inAsyncCall: _packageProvider.packageLoader,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).package_details),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(20),
          // width: double.infinity,
          // color: Colors.blue,
          child: appButton(S.of(context).buy_package, onpress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(S.of(context).confirm),
                    content: BuyPackageDialog(
                      onConfirm: _doSubscription,
                    ),
                  );
                });

            // Navigator.of(context)
            //     .push(NavSlideFromRight(page: Payment(widget.packageModel)));
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomListView(
          child: ListView(
            children: [
              packageDetailsHeader(
                context,
                isTowRows: true,
                packageModel: widget.packageModel,
                cardData: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          cardItemInfo(S.of(context).you_give,
                              "${currencyFormat(widget.packageModel.fees)}"),
                          cardItemSeparator(),
                          cardItemInfo(S.of(context).you_earn,
                              "${currencyFormat(widget.packageModel.total)}"),
                        ],
                      ),
                    ),
                    cardItemSeparator2(),
                    cardItemInfo(S.of(context).referrals,
                        "${widget.packageModel.subscribersNo}",
                        isCurrency: false),
                  ],
                ),
              ),
              // SizedBox(height: 20),
              packageDescriptionWidget(widget.packageModel.description),
            ],
          ),
        ),
      ),
    );
  }
}
