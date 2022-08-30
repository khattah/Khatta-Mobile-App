import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences _prefs;

  static void _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  static void set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  static void remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }

  static void clear() async {
    _getInstance();
    _prefs.clear();
  }

  static void savePayloadInfo(Map<String, dynamic> payload) {
    StorageHelper.set(StorageKeys.userId, payload['uid']);
    StorageHelper.set(StorageKeys.phone, "+${payload['phone']}");
    StorageHelper.set(StorageKeys.userFullName, payload['fullName']);
    StorageHelper.set(StorageKeys.userProfileImage, payload['photo']);
    StorageHelper.set(StorageKeys.cardId, payload['card'] ?? '');
  }
}
