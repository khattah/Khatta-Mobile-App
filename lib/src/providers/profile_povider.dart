import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/response_model.dart';
import 'package:jt_trading/src/models/user_model.dart';
import 'package:jt_trading/src/repositories/auth_repo.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';

class ProfileProvider with ChangeNotifier {
  bool loading = false, imageLoading = false;
  UserModel user = new UserModel();
  File tempUserProfileImage;

  void loadUserInfo() async {
    print("in loading profile info");
    user.id = await StorageHelper.get(StorageKeys.userId) ?? "";
    user.name =
        await StorageHelper.get(StorageKeys.userFullName) ?? "UnKnow User";
    user.imageUrl =
        await StorageHelper.get(StorageKeys.userProfileImage) ?? "not fount";
    user.phoneNumber = await StorageHelper.get(StorageKeys.phone) ?? "9xxxxxx";
    user.cardID = await StorageHelper.get(StorageKeys.cardId) ?? "";

    print(user.imageUrl);
    notifyListeners();
  }

  Future<bool> updateProfileInfo(Map<String, dynamic> data,
      {bool isProfilePhoto = false}) async {
    print("-------------------------------------");
    print(data);
    print("-------------------------------------");
    loading = true;
    notifyListeners();
    CustomToast().showToast(S.current.updating);
    print("photo response is .....................01");
    ResponseModel responseModel = await AuthRepo()
        .updateProfileInfo(newUserInfo: data, isProfilePhoto: isProfilePhoto);
    loading = false;
    notifyListeners();
    print("photo response is .....................02");
    print(responseModel.data);
    if (responseModel.status) {
      StorageHelper.set(StorageKeys.token, responseModel.data['token']);
      StorageHelper.savePayloadInfo(responseModel.data['payload']);
      loadUserInfo();
      CustomToast().showToast(S.current.updated);
      return true;
    }
    CustomToast().showToast(responseModel.message);
    return false;
  }

  void updatePhone() async {}
  void logout() async {
    StorageHelper.clear();
    Navigator.of(navigatorKey.currentContext).pushReplacement(
      NavSlideFromRight(
        page: Login(),
      ),
    );
  }

  Future updateImage({bool fromGallery = false}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);
    if (pickedFile == null) return;
    imageLoading = true;
    tempUserProfileImage = File(pickedFile.path);
    notifyListeners();
    Map<String, dynamic> data = {
      "lang": "en",
      "origin": await MultipartFile.fromFile(pickedFile.path)
    };
    print("path is .....");
    print(pickedFile.path);
    bool serverCheck = await updateProfileInfo(data, isProfilePhoto: true);
    imageLoading = false;
    notifyListeners();
  }
}
