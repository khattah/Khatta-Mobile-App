import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/package_details_active.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class ActivePackages extends StatefulWidget {
  @override
  _ActivePackagesState createState() => _ActivePackagesState();
}

class _ActivePackagesState extends State<ActivePackages> {
  PackageProvider _packageProvider;

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).active_packages.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    child: _packageProvider.activePackageLoader
                        ? SizedBox(
                            width: 30,
                            height: 30,
                            child: appCustomProgressIndicator(),
                          )
                        : InkWell(
                            onTap: () {
                              _packageProvider.fetchActivePackages();
                            },
                            child: Icon(
                              Icons.refresh,
                              size: 35,
                            ),
                          ),
                  )
                ],
              ),
            ),
            Expanded(
              child: CustomListView(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                      appPadding, 0, appPadding, appPadding),
                  children: List<Widget>.generate(
                      _packageProvider.activePackages.length,
                      (index) => activePackage(
                          _packageProvider.activePackages[index])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activePackage(SubscribePackageModel activePackage) {
    return InkWell(
      onTap: () {
        if (_packageProvider.activePackageLoader) return;
        Navigator.of(context).push(NavSlideFromRight(
            page: ActivePackageDetails(
          activePackage: activePackage,
        )));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(activePackage.subscribeState.name,
                      style: TextStyle(
                          color: activePackage.isActive
                              ? Colors.amber
                              : Colors.green)),
                  Text(
                      "${SubscribePackageModel.dateTimeAgo(activePackage.date, context)}"),
                ],
              ),
              SizedBox(height: 10),
              Text(
                activePackage.package.name,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10),
              Text(S.of(context).state),
              SizedBox(height: 5),
              Stack(
                children: [
                  Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width * .93,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 5,
                    width: (MediaQuery.of(context).size.width * .93) /
                        activePackage.subscribersNo *
                        activePackage.subscribed,
                    // activePackage.subscribed,
                    // width: (MediaQuery.of(context).size.width / 1) * 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              ),
              SizedBox(height: 10),
              views(activePackage),
            ],
          ),
          // child: ,
        ),
      ),
    );
  }

  Widget accepted(SubscribePackageModel activePackage) {
    final bloc = Provider.of<LanguageProvider>(context, listen: false);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        activePackage.subscribers.length == 0
            ? Container()
            : Stack(
                children: List<Widget>.generate(
                  activePackage.subscribers.length,
                  (index) => Container(
                    margin: !bloc.isArabic
                        ? EdgeInsets.only(left: index * 10.0)
                        : EdgeInsets.only(right: index * 10.0),
                    // height: 20,
                    // width: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: activePackage.subscribers[index].imageUrl,
                        // imageUrl: "https://random.imagecdn.app/200/200",
                        // color: Colors.green,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: randomColor(), shape: BoxShape.circle),
                  ),
                ),
              ),
        SizedBox(width: 5),
        Text(
          "${activePackage.subscribed}${bloc.isArabic ? '\\' : '/'}${activePackage.subscribersNo} ${S.of(context).accepted}"
              .toUpperCase(),
          // bloc.isArabic?"${activePackage.subscribersNo}/${activePackage.subscribed} ${S.of(context).accepted}"
          //       .toUpperCase():"${activePackage.subscribed}/${activePackage.subscribersNo} ${S.of(context).accepted}".toUpperCase(),
          // textDirection:TextDirection.ltr ,
          style: TextStyle(
              color: appPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  Widget views(SubscribePackageModel activePackage) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).view_details.toUpperCase(),
                style: TextStyle(
                    color: appPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward,
                color: appPrimaryColor,
              )
            ],
          ),
          accepted(activePackage),
        ],
      ),
    );
  }
}
