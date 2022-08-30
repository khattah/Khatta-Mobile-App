import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';

bool checkAllAreFill(List<String> fields) {
  for (String field in fields) {
    if (field.isEmpty) {
      CustomToast().showToast(S.current.please_fill_all_fields);
      return false;
    }
  }
  return true;
}

bool userNameValidation(String username) {
  if (username.length != 9) {
    CustomToast().showToast(S.current.invalid_username);
    return false;
  }
  return true;
}

bool loginPasswordValidation(String username) {
  if (username.length < 4) {
    CustomToast().showToast(S.current.short_password);
    return false;
  }
  return true;
}

bool nameValidation(String username) {
  if (username.length < 2) {
    CustomToast().showToast(S.current.invalid_name);
    return false;
  }
  return true;
}
