import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:jt_trading/src/values/serverInfo.dart' as BASE_URL;

class HttpHelper {
  static Dio _client;

  static Future<Dio> _getInstance(
      {bool isAuth, bool withCookie, bool withToken}) async {

    if (_client == null) _client = Dio();

    if (!isAuth) {
      // _client.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      _client.options.headers = {
        // "Content-Type": "application/x-www-form-urlencoded",
        "Content-Type": "application/form-data",
        // "Accept": "application/json",
      };
      return _client;
    }
    print("is auth api .......");
    final storageToken = await StorageHelper.get(StorageKeys.token);
    var headers = {
      "Content-Type": "application/form-data",
      'Authorization': 'Bearer $storageToken'
    };
    if (withToken == true) headers = {...headers, 'Bearer': '$storageToken'};
    _client.options.headers = headers;

    return _client;
  }

  static Future<Response> httpRequest(
    String newUrl, {
      bool isFile=false,
    bool isAuth = false,
    bool withToken = true,
    String methodType = "get",
    dynamic bodyData,
  }) async {
    final String url = "${BASE_URL.restApiUrl}$newUrl";
    print(url);
    final instance = await _getInstance(isAuth: isAuth, withToken: withToken);
    switch (methodType) {
      case "put":
        
        return instance.put(url, data:FormData.fromMap(bodyData));
      case "post":
        print("in post method ...");
        return instance.post(url, data: FormData.fromMap(bodyData));
    }
    print("in get method ......");
    return instance.get(url);
  }
}
