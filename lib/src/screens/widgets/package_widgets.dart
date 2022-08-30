import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/state_model.dart';
import 'package:jt_trading/src/models/subscribers_model.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/browse_packages.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Widget packageDetailsHeader(BuildContext context,
    {Widget cardData,
    bool isTowRows = false,
    PackageModel packageModel,
    StateModel state}) {
  return Stack(
    children: [
      Container(
        color: Colors.orange[400],
        height: MediaQuery.of(context).size.height * .3,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform(
                    transform: Matrix4.skewX(0.2),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 200,
                      width: 150,
                      // color: Colors.black12,
                      child: Image.asset("assets/trophy.png"),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(5),
                            // height: 20,
                            // width: 100,
                            decoration: BoxDecoration(
                                color: state.color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                state.name.toUpperCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                    SizedBox(height: 10),
                    Text(
                      packageModel.name,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: isTowRows ? 200 : 100,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .23),
            width: MediaQuery.of(context).size.width * .7,
            child: Card(
              elevation: 10,
              child: cardData,
            ),
          ),
        ],
      )
    ],
  );
}

Widget cardItemInfo(String title, String info, {bool isCurrency = true}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height: 5),
        Text(
          info,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: appPrimaryColor),
        ),
        SizedBox(height: 5),
        isCurrency
            ? Text(
                S.current.sdg,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: appPrimaryColor),
              )
            : SizedBox(),
      ],
    ),
  );
}

Widget cardItemSeparator() {
  return Container(height: 100, width: .5, color: Colors.black38);
}

Widget cardItemSeparator2() {
  return Container(height: .5, color: Colors.black38);
}

Widget referralsWidget(
    List<SubscribersModel> subscribers, int totalSubscribers) {
  return Container(
    padding: EdgeInsets.only(top: 30, bottom: 100),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        subscribers.length == 0
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  // S.current.referrals
                  "${S.current.referrals} (${subscribers.length}/$totalSubscribers)"
                      .toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
        SizedBox(height: 10),
        subscribers.length == 0
            ? Container(
                padding: EdgeInsets.all(appPadding),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 10),
                    Image.asset("assets/no_subscribers.png",
                        width: 150, height: 150),
                    Text(
                      S.current.no_subscribers_msg,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Column(
                children: List<Widget>.generate(
                  subscribers.length,
                  (index) => Container(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1.5, color: appPrimaryColor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            // padding: EdgeInsets,
                            child: CachedNetworkImage(
                              imageUrl: subscribers[index].imageUrl,
                              // imageUrl: "https://random.imagecdn.app/200/200",
                              // color: Colors.green,
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: randomColor(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subscribers[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.current.accepted,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              subscribers[index].paymentStatus
                                  ? Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            S.current.paid,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
      ],
    ),
  );
}

Widget packageWidget(PackageModel packageModel, BuildContext context) {
  final lang = Provider.of<LanguageProvider>(context, listen: false);
  return Container(
    child: Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: lang.isArabic
                ? BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  ),
            // borderRadius: BorderRadius.only(bottomRight: Radius.circular(4),topRight: Radius.circular(4)),
            child: Container(
              width: 120,
              height: 120,
              // color: randomColor(),
              child: CachedNetworkImage(
                imageUrl: packageModel.imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => Container(
                  color: Colors.black12,
                  // child: Center(child: Text(packageModel.name[0]),),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              // color: Colors.blue,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    packageModel.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    packageModel.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget browsePackageBtn(BuildContext context) {
  //
  return Row(
    children: [
      Expanded(
          child: appButton(S.of(context).browse_Packages, onpress: () {
        Provider.of<PackageProvider>(context, listen: false).fetchPackages();
        Navigator.of(context).push(
          NavSlideFromRight(
            page: BrowsePackages(),
          ),
        );
      })),
    ],
  );
}

Widget noPackages(BuildContext context, String msg) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/no_packages.png",
        width: 250,
        height: 250,
      ),
      // SizedBox(height: 10),
      Text(msg, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
      SizedBox(height: 20),
      browsePackageBtn(context)
    ],
  );
}

Widget packageDescriptionWidget(String description) {
  return Container(
    padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 100),
    child: Text(
      description,
      style: TextStyle(fontSize: 16),
    ),
  );
}
