import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/utils/app_methods.dart';
import 'package:provider/provider.dart';

class InvitationPackageDetails extends StatefulWidget {
  var invitationId;
  InvitationPackageDetails({this.invitationId});
  @override
  _InvitationPackageDetailsState createState() =>
      _InvitationPackageDetailsState();
}

class _InvitationPackageDetailsState extends State<InvitationPackageDetails> {
  SubscribePackageModel _invitationPackage;
  bool _loading = false;
  PackageProvider _packageProvider;

  @override
  void initState() {
    // TODO: implement initState
    _loadInvitationPackageDetails();
    super.initState();
  }

  _loadInvitationPackageDetails() async {
    setState(() {
      _loading = true;
    });
    _invitationPackage = await PackageProvider()
        .getInvitationPackageDetails(widget.invitationId);
    setState(() {
      _loading = false;
    });
  }

  _acceptOrCancelInvitation({bool isAccept = false}) async {
    if (isAccept) {
      bool check = await _packageProvider
          .acceptSubscribeInvitation(_invitationPackage.id);
      if (check) _navToHome(2);
    } else {
      _navToHome(0);
    }
  }

  void _navToHome(int timeInSec) {
    Future.delayed(Duration(seconds: timeInSec), () {
      Navigator.of(context)
          .pushReplacement(NavSlideFromRight(page: MainTabs()));
    });
  }

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return AppProcessModal(
      inAsyncCall: _packageProvider.packageLoader,
      child: WillPopScope(
        onWillPop: () {
          _navToHome(0);
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(S.of(context).invitation),
          ),
          floatingActionButton: _loading || !_invitationPackage.isActive
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: appButton(S.of(context).accept_invitation,
                            onpress: () {
                          _acceptOrCancelInvitation(isAccept: true);
                        }),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: appButton(S.of(context).cancel, isPlane: true,
                            onpress: () {
                          _acceptOrCancelInvitation();
                        }),
                      )
                    ],
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    print("loading .. $_loading");
    if (_loading) return Center(child: appCustomProgressIndicator());
    return CustomListView(
      child: ListView(
        children: [
          packageDetailsHeader(
            context,
            packageModel: _invitationPackage.package,
            isTowRows: true,
            cardData: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      cardItemInfo(S.of(context).you_give,
                          "${currencyFormat(_invitationPackage.fees)}"),
                      cardItemSeparator(),
                      cardItemInfo(S.of(context).you_earn,
                          "${currencyFormat(_invitationPackage.total)}"),
                    ],
                  ),
                ),
                cardItemSeparator2(),
                cardItemInfo(S.of(context).referrals_needed,
                    "${_invitationPackage.subscribersNo}",isCurrency: false),
              ],
            ),
          ),
          packageDescriptionWidget(_invitationPackage.package.description),
        ],
      ),
    );
  }
}
