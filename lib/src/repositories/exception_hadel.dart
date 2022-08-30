import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/response_model.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class ExceptionHandler {
  ResponseModel handel(e) {
    ResponseModel response = ResponseModel();
    print("Exception .....");
    print(e.runtimeType);
    print(e);
    response.message = "Something went wrong";

    // CustomToast().showToast(e.message);

    if (e is DioError) {
      print("is dio ....");
      response.message = e.message;
      response.errorCode = e.response?.statusCode;
      if (e.error is SocketException) {
        response.errorCode = 000;
        print("is dio SocketException....");
        // response.message = "muller";
        response.message = "${S.current.no_internet}";
      }
      if (e.response?.statusCode == 550)
        Provider.of<ProfileProvider>(navigatorKey.currentContext, listen: false)
            .logout();
    }
    print("not printing this ...");
    CustomToast().showToast(response.message);

    return response;
  }
}
