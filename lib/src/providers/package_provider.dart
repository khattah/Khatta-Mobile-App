import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jt_trading/src/models/package_model.dart';
import 'package:jt_trading/src/models/response_model.dart';
import 'package:jt_trading/src/models/subscribe_package_model.dart';
import 'package:jt_trading/src/repositories/package_repo.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';

class PackageProvider with ChangeNotifier {
  bool packageLoader = false,
      packageHistoryLoader = false,
      activePackageLoader = false;

  List<PackageModel> packages = [];
  List<SubscribePackageModel> historyPackages = [];
  List<SubscribePackageModel> activePackages = [];

  Future fetchPackages() async {
    packages.clear();
    packageLoader = true;
    notifyListeners();
    ResponseModel responseModel =
        await PackageRepo().fetchPackages("jt-package");
    packageLoader = false;
    notifyListeners();
    if (!responseModel.status) return;
    packages = PackageModel.toListOfModel(responseModel.data as List);
    packages = packages.reversed.toList();
    print("************* muller **************88888");
  }

  Future fetchHistoryPackages() async {
    historyPackages.clear();
    packageHistoryLoader = true;
    notifyListeners();
    ResponseModel responseModel =
        await PackageRepo().fetchPackages("jt-subscription/history");
    packageHistoryLoader = false;
    notifyListeners();
    if (!responseModel.status) return;
    historyPackages =
        SubscribePackageModel.toListOfModel(responseModel.data as List);
  }

  Future fetchActivePackages() async {
    print("in active pakage fetching ...........");
    // activePackages.clear();
    activePackageLoader = true;
    notifyListeners();
    ResponseModel responseModel =
        await PackageRepo().fetchPackages("jt-subscription");
    activePackageLoader = false;
    notifyListeners();
    if (!responseModel.status) return;
    print(responseModel.data);
    activePackages =
        SubscribePackageModel.toListOfModel(responseModel.data as List);
    activePackages = activePackages.reversed.toList();
  }

  Future<SubscribePackageModel> getInvitationPackageDetails(
      var invitationId) async {
    ResponseModel responseModel = await PackageRepo()
        .fetchPackages("jt-subscription/fetch/$invitationId");
    return SubscribePackageModel.fromMap(responseModel.data);
  }

  Future<bool> acceptSubscribeInvitation(var invitationCode) async {
    packageLoader = true;
    notifyListeners();
    ResponseModel responseModel = await PackageRepo()
        .acceptSubscribeInvitation({"subscription": invitationCode});
    CustomToast().showToast(responseModel.message);
    packageLoader = false;
    notifyListeners();
    return responseModel.status;
  }

  Future<SubscribePackageModel> buySubscribeToPackage(var packageCode) async {
    packageLoader = true;
    notifyListeners();
    ResponseModel responseModel =
        await PackageRepo().buyPackage({"package": packageCode});
    packageLoader = false;
    CustomToast().showToast(responseModel.message);
    notifyListeners();

    if (responseModel.status) {
      return SubscribePackageModel.fromMap(responseModel.data);
      // return _subscribePackageModel;
    }
    return null;
  }

  Future<bool> redeemSubscription(var packageCode) async {
    packageLoader = true;
    notifyListeners();
    ResponseModel responseModel =
        await PackageRepo().redeemSubscription({"package": packageCode});
    CustomToast().showToast(responseModel.message);
    packageLoader = false;
    notifyListeners();
    return responseModel.status;
  }

  // SubscribePackageModel _subscribePackageModel = SubscribePackageModel.fromMap(
  //   {
  //     "id": "01525c55e9c33e741365ec0667ff9eee",
  //     "fees": 1200,
  //     "total": 5000,
  //     "url": "",
  //     "finish": 0,
  //     "owner": null,
  //     "is_subscribed": null,
  //     "subscribers_no": 5,
  //     "subscribed": 0,
  //     "full": false,
  //     "package": {
  //       "id": "ba1ecf75246daf897a24011488bd806e",
  //       "name": " الطلبة الجامعين",
  //       "description": "ساعد زميلك",
  //       "imageURL":
  //           "http://66.29.135.175/mb-api/jt-image/fetch/O-PI/27486c7f373d017c3f94b674a3587374.jpg",
  //       "fees": 1200,
  //       "total": 5000,
  //       "subscribers_no": 5,
  //       "view": 0,
  //       "date": "14-08-2021 09:18:21+00:00"
  //     },
  //     "subscribers": [
  //       {
  //         "id": "uscf78b026e96ca6887b624a18562d4102dx",
  //         "full_name": "Muller  Muller",
  //         "first_name": "Muller",
  //         "second_name": null,
  //         "last_name": "Muller",
  //         "phone": "964154625",
  //         "birth": null,
  //         "social": null,
  //         "is_active": 1,
  //         "gender": "male",
  //         "image": "https://ui-avatars.com/api/?name=Muller++Muller",
  //         "notifier": null,
  //         "order_id": 75587291917,
  //         "nqod_payment": "http://66.29.135.175//payment/nqod/75587291917",
  //         "payment_status": false
  //       }
  //     ],
  //     "payment_status": false,
  //     "payment_url": "http://66.29.135.175//payment/nqod/75587291917",
  //     "date": "2021-08-16 01:41:35+00:00"
  //   },
  // );
}
