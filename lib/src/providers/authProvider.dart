import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/country_code.dart';
import 'package:jt_trading/src/models/response_model.dart';
import 'package:jt_trading/src/repositories/auth_repo.dart';
import 'package:jt_trading/src/screens/auth/verification.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  bool authLoader = false;
  // BuildContext context;
  // // AuthProvider();
  // AuthProvider([BuildContext context]) : this.context = context;

  Future<bool> login(Map<String, String> loginData) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel = await AuthRepo().login(loginData);
    authLoader = false;
    notifyListeners();

    print("yyyyyyyyy ${responseModel.errorCode}");
    if (!responseModel.status) {
      CustomToast().showToast(responseModel.message);
      return false;
    }
    StorageHelper.set(StorageKeys.token, responseModel.data['token']);
    if (responseModel.data['payload']['account_status'] == 0) {
      await AuthRepo().sentSMsUnActiveAccount();
      Navigator.of(navigatorKey.currentContext).pushReplacement(
        NavSlideFromRight(
          page: Verification(
            countryCode: loginData['code'],
            phoneNumber: loginData['identifier'],
          ),
          // page: MainTabs(isAuth: "Authentic",),
        ),
      );
      return false;
    }
    StorageHelper.set(StorageKeys.auth, "AUTHENTIC");
    StorageHelper.savePayloadInfo(responseModel.data['payload']);
    return true;
  }

  Future<bool> signUp(Map<String, String> signUpData) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel =
        await AuthRepo().signUp(signUpData: signUpData);
    authLoader = false;
    notifyListeners();

    if (!responseModel.status) {
      CustomToast().showToast(responseModel.message);
      return false;
    }

    StorageHelper.set(
      StorageKeys.token,
      responseModel.data['token'],
    );
    return true;
  }

  Future<bool> verification(String code) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel = await AuthRepo().verification(code: code);
    authLoader = false;
    notifyListeners();

    CustomToast().showToast(responseModel.message);

    if (!responseModel.status) return false;

    StorageHelper.set(StorageKeys.token, responseModel.data['token']);
    await StorageHelper.set(StorageKeys.auth, "AUTHENTIC");
    StorageHelper.savePayloadInfo(responseModel.data['payload']);

    return true;
  }

  Future<bool> verificationForgetPassword(
      {String phoneNumber, String countryCode, String code}) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel = await AuthRepo().verificationForgetPassword(
        phoneNumber: phoneNumber, countryCode: countryCode, code: code);
    authLoader = false;
    notifyListeners();

    CustomToast().showToast(responseModel.message);

    if (!responseModel.status) return false;

    // StorageHelper.set(StorageKeys.token, responseModel.data['token']);
    // await StorageHelper.set(StorageKeys.auth, "AUTHENTIC");
    // StorageHelper.savePayloadInfo(responseModel.data['payload']);

    return true;
  }

  Future<bool> forgetPassword({String phoneNumber, String countryCode}) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel = await AuthRepo()
        .forgetPassword(phoneNumber: phoneNumber, countyCode: countryCode);
    authLoader = false;
    notifyListeners();
    return responseModel.status;
  }

  Future<bool> changePassword(
      {String oldPassword,
      String newPassword,
      String confirmNewPassword}) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel = await AuthRepo().changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword);
    authLoader = false;
    notifyListeners();
    if (!responseModel.status) CustomToast().showToast(responseModel.message);

    return responseModel.status;
  }

  Future<bool> resetPassword(
      {String otpCode, String newPassword, String confirmNewPassword}) async {
    authLoader = true;
    notifyListeners();
    ResponseModel responseModel = await AuthRepo().resetPassword(
        otpCode: otpCode,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword);
    authLoader = false;
    notifyListeners();
    if (!responseModel.status) CustomToast().showToast(responseModel.message);

    return responseModel.status;
  }

  Future<List<CountryCodeModel>> fetchCountriesCodes(String langCode) async {
    List<CountryCodeModel> _address = [];
    final _repo = AuthRepo();
    ResponseModel responseModel =
        await _repo.fetchCountriesCodes(langCode: langCode);
    _address = CountryCodeModel.toListOfModel(responseModel.data ?? []);

    return _address;
  }

  Future<bool> sentSMS({String phoneNumber, String countryCode}) async {
    List<CountryCodeModel> _address = [];
    final _repo = AuthRepo();
    ResponseModel responseModel =
        await _repo.sentSMs(phoneNumber: phoneNumber, countyCode: countryCode);
    return true;
  }
  // void savePayloadInfo(Map<String ,dynamic> payload)  {
  //   StorageHelper.set(StorageKeys.userId, payload['uid']);
  //   StorageHelper.set(StorageKeys.phone, "+${payload['phone']}");
  //   StorageHelper.set(StorageKeys.userFullName, payload['fullName']);
  //   StorageHelper.set(StorageKeys.userProfileImage, payload['photo']);
  // }
}
