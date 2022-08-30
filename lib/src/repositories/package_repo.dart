import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/response_model.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/repositories/exception_hadel.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/http/http_helper.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class PackageRepo with ExceptionHandler {
  Future<ResponseModel> fetchPackages(String subUrl) async {
    print("in fetch  packages");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(subUrl, isAuth: true);
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  // ResponseModel handel(e) {
  //   ResponseModel response = ResponseModel();
  //   print("Exception .....");
  //   print(e.runtimeType);
  //   print(e);
  //
  //   // CustomToast().showToast(e.message);
  //
  //   if (e is DioError) {
  //     response.message = e.message;
  //     if (e.error is SocketException) {
  //       response.message = "${S.current.no_internet}";
  //     }
  //     if (e.response?.statusCode == 550)
  //       Provider.of<ProfileProvider>(navigatorKey.currentContext, listen: false)
  //           .logout();
  //   }
  //   CustomToast().showToast(response.message);
  //
  //   return response;
  // }

  Future<ResponseModel> acceptSubscribeInvitation(
      Map<String, dynamic> data) async {
    print("in accept invitation $data");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-subscription/subscribe",
        methodType: "post", bodyData: data, isAuth: true);
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> buyPackage(Map<String, dynamic> data) async {
    print("in buy package  $data");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-subscription/create",
        methodType: "post", bodyData: data, isAuth: true);
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> redeemSubscription(Map<String, dynamic> data) async {
    print("in redeem subscription  $data");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jjt-subscription/close",
        methodType: "post", bodyData: data, isAuth: true);
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }
}
