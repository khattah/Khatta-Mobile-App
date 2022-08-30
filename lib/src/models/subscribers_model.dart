import 'package:jt_trading/src/models/package_model.dart';

class SubscribersModel {
  String id;
  String name;
  String imageUrl;
  bool paymentStatus;

  SubscribersModel({this.id,this.name,this.imageUrl,this.paymentStatus});

  SubscribersModel.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name =  json["full_name"].toString();
    // imageUrl =  "";
    imageUrl =  json["image"].toString() ;
    paymentStatus = json["payment_status"];
  }
  static List<SubscribersModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => SubscribersModel.fromMap(data)).toList();
  }
}
