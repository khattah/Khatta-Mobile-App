import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jt_trading/src/models/response_model.dart';
import 'package:jt_trading/src/repositories/exception_hadel.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/http/http_helper.dart';
import 'package:jt_trading/src/values/constants.dart';
// import ;

class AuthRepo with ExceptionHandler {
  Future<ResponseModel> login(Map<String, dynamic> loginData) async {
    print("in do login .... username $loginData");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/login",
        methodType: "post", bodyData: loginData);
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
      // if(response.data)
    }).catchError((e) {
      response = handel(e);
    });
    print("Are you .....");
    return response;
  }

  Future<ResponseModel> signUp({Map<String, String> signUpData}) async {
    print("in do signup .... $signUpData)");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/signup",
        methodType: "post", bodyData: signUpData);
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> forgetPassword(
      {String phoneNumber, String countyCode}) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/reset",
        methodType: "post",
        bodyData: {"identifier": phoneNumber, "code": countyCode});
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> changePassword(
      {String oldPassword,
      String newPassword,
      String confirmNewPassword}) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/update/password",
        methodType: "post",
        isAuth: true,
        bodyData: {
          "current_password": oldPassword,
          "new_password": newPassword,
          "cmf_new_password": confirmNewPassword
        });
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> resetPassword(
      {String otpCode, String newPassword, String confirmNewPassword}) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/reset/submit",
        methodType: "post",
        bodyData: {
          "code": otpCode,
          "password": newPassword,
          "confirm_password": confirmNewPassword
        });
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> verification({String code}) async {
    print("in do verification   .... $code)");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/activate/account",
        methodType: "post", bodyData: {"code": code}, isAuth: true);
    await apiResponse.then((Response res) async {
      print("***********************************");
      print(res.data);
      response = ResponseModel.fromJson(res.data as Map);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> verificationForgetPassword(
      {String phoneNumber, String countryCode, String code}) async {
    print("in do verification   .... $code)");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/reset/verify",
        methodType: "post",
        bodyData: {
          "country_code": countryCode,
          "identifier": phoneNumber,
          "code": code
        },
        isAuth: true);
    await apiResponse.then((Response res) async {
      print("***********************************");
      print(res.data);
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> updateProfileInfo(
      {Map<String, dynamic> newUserInfo, bool isProfilePhoto = false}) async {
    print("in do update user info  .... $newUserInfo)");
    ResponseModel response = ResponseModel();

    final apiResponse = HttpHelper.httpRequest(
      isProfilePhoto
          ? "jt-member/update/profile-photo"
          : "jt-member/update/profile",
      methodType: "post",
      bodyData: newUserInfo,
      isAuth: true,
    );
    await apiResponse.then((Response res) async {
      print("***********************************");
      print(res.data);
      if (res.statusCode == 200) {
        response = ResponseModel.fromJson(res.data);
      } else {
        CustomToast().showToast("something went wrong with server ....");
      }
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> fetchCountriesCodes({String langCode = "en"}) async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("jt-country/$langCode", isAuth: false);
    await apiResponse.then((Response res) async {
      print("***********************************");
      print(res.data.runtimeType);
      print(res.data);
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> sentSMs({String phoneNumber, String countyCode}) async {
    print("$phoneNumber  --------- $countyCode");
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("jt-member/reset/verify",
        isAuth: false,
        methodType: "post",
        bodyData: {"identifier": phoneNumber, "code": countyCode});
    await apiResponse.then((Response res) async {
      print("***********************************");
      print(res.data);
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }

  Future<ResponseModel> sentSMsUnActiveAccount() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
      "jt-member/activation/send",
      isAuth: true,
      methodType: "post",
    );
    await apiResponse.then((Response res) async {
      print("***********************************");
      print(res.data);
      response = ResponseModel.fromJson(res.data);
    }).catchError((e) {
      response = handel(e);
    });
    return response;
  }
}
