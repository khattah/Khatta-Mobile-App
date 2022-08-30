import 'package:jt_trading/src/utils/storage/storage_helper.dart';

class UserModel {
  String id;
  String name;
  String imageUrl;
  String phoneNumber;
  String cardID;
  UserModel({this.id, this.name, this.imageUrl, this.phoneNumber, this.cardID});

  UserModel.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    imageUrl = json["image"];
    phoneNumber = json["phone"];
    cardID = json["card"]??"غير مدرج";
  }
}
