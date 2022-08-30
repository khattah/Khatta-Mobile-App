import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/state_model.dart';
import 'package:jt_trading/src/models/subscribers_model.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class SubscribePackageModel {
  String id;
  String fees;
  String total;
  int views;
  int subscribersNo;
  List<SubscribersModel> subscribers;
  int subscribed;
  PackageModel package;
  int state;
  DateTime date;
  bool isOwner;
  bool paymentStatus;
  String paymentUrl;
  String orderId;

  SubscribePackageModel(
      {this.id,
      this.fees,
      this.total,
      this.views,
      this.subscribersNo,
      this.subscribers,
      this.subscribed,
      this.package,
      this.state,
      this.date,
      this.isOwner,
      this.paymentStatus,
      this.paymentUrl,
      this.orderId});

  SubscribePackageModel.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    fees = json["fees"].toString();
    total = json["total"].toString();
    views = json["views"];
    subscribersNo = json["subscribers_no"];
    subscribers = SubscribersModel.toListOfModel(
        json["subscribers"] == null ? [] : json["subscribers"]);
    subscribed = json["subscribed"];
    package = PackageModel.fromMap(json["package"]);
    state = json["finish"];
    // date = DateTime.parse(DateFormat("dd-mm-yyyy hh:mm:ss")
    //     .format(DateTime.parse(json["date"])));
    // .format(DateTime.parse("14-08-2021 09:16:59+00:00")));
    // date = DateTime.parse("2021-08-14 09:18:21+00:00");
    print("*****************************************");
    print(json["date"]);
    print("*****************************************");
    date = DateTime.parse(json["date"]);
    isOwner = json["owner"];
    paymentStatus = json["payment_status"];
    paymentUrl = json["payment_url"];
    orderId = json["order_id"].toString() ?? "90507301485";
  }

  get subscribeState => !this.paymentStatus
      ? StateModel(S.current.un_paid, Colors.lightBlueAccent)
      : this.subscribersNo != this.subscribed
          ? StateModel(S.current.on_progress, Colors.green)
          : StateModel(S.current.finished_state, Colors.black);

  get isActive => this.subscribersNo != this.subscribed;
  get isFinished => this.state == 1 ? true : false;

  static List<SubscribePackageModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => SubscribePackageModel.fromMap(data)).toList();
  }

  static String dateTimeAgo(DateTime _date, BuildContext context) {
    DateTime now = DateTime.now().toUtc();
    print("---------------------");
    print(_date);
    print(now);

    // print( DateFormat.Hm("2021-08-22 10:07:39"));



    // print(_date.toLocal());
    // print(_date);
    // print(now);
    // print(now.toLocal());
    // print(_date.toUtc());
    // print(DateTime.parse('2018-09-07T17:29:12+02:00').isUtc);
    // print(now);
    // _date.toUtc();
    print("---------------------");
    final lang = Provider.of<LanguageProvider>(context, listen: false);
    final dateAgo = now.subtract(now.difference(_date));
    timeago.setLocaleMessages(lang.code,
        lang.code == "en" ? timeago.EnMessages() : timeago.ArMessages());
    // timeago.setLocaleMessages(lang.code, lang.code=="en"?timeago.EnShortMessages():timeago.ArShortMessages());
    return timeago.format(dateAgo, locale: "${lang.code}");
  }
}
