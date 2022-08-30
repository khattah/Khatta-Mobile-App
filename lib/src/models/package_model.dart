import 'package:jt_trading/src/models/subscribers_model.dart';

class PackageModel {
  String id;
  String name;
  String description;
  String imageUrl;
  String fees;
  String total;
  int views;
  int subscribersNo;
  List<SubscribersModel> subscribers;
  PackageModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.fees,
    this.total,
    this.views,
    this.subscribersNo,
    this.subscribers,
  });

  PackageModel.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    imageUrl = json["imageURL"];
    fees = json["fees"].toString();
    // fees = 500000000000.toString();
    total = json["total"].toString();
    views = json["views"];
    subscribers = SubscribersModel.toListOfModel(json["subscribers"] == null ? [] : json["subscribers"]);
    subscribersNo = json["subscribers_no"];
    // int state=;
  }
  static List<PackageModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => PackageModel.fromMap(data)).toList();
  }
}
