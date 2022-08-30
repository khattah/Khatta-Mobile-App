import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:jt_trading/src/utils/app_methods.dart';

class HistoryPackageDetails extends StatefulWidget {
  SubscribePackageModel historyPackage;
  HistoryPackageDetails(this.historyPackage);
  @override
  _HistoryPackageDetailsState createState() => _HistoryPackageDetailsState();
}

class _HistoryPackageDetailsState extends State<HistoryPackageDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).history_packages),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CustomListView(
          child: ListView(
            children: [
              packageDetailsHeader(
                context,
                isTowRows: true,
                packageModel:widget.historyPackage.package ,
                cardData: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          cardItemInfo(S.of(context).you_give, "${currencyFormat(widget.historyPackage.fees)}"),
                          cardItemSeparator(),
                          cardItemInfo(S.of(context).you_earn, "${currencyFormat(widget.historyPackage.total)}"),
                        ],
                      ),
                    ),
                    cardItemSeparator2(),
                    Row(
                      children: [
                        cardItemInfo(S.of(context).referrals, "X34GR"),
                        cardItemSeparator(),
                        cardItemInfo(S.of(context).redeemed_via, S.of(context).vendor),
                      ],
                    ),
                  ],
                ),
              ),
              referralsWidget(widget.historyPackage.subscribers,widget.historyPackage.subscribersNo),
            ],
          ),
        ),
      ),
    );
  }
}
