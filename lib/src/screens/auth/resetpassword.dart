import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/info_dialog.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/validators.dart' as validator;
import 'package:provider/provider.dart';

class RestPassword extends StatefulWidget {
  final String optCode;
  RestPassword({@required this.optCode});
  @override
  _RestPasswordState createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  String _newPassword = "", _confirmNewPassword = "";
  bool _passwordShowHide = true;
  AuthProvider _authBlock;
  _doChangePassword() async {
    if (!(validator.checkAllAreFill([_newPassword, _confirmNewPassword]) &&
        validator.loginPasswordValidation(_newPassword) &&
        validator.loginPasswordValidation(_confirmNewPassword))) {
      return;
    }
    if (_newPassword != _confirmNewPassword) {
      CustomToast().showToast(S.of(context).password_not_match);
      return;
    }
    bool check = await _authBlock.resetPassword(
        otpCode: widget.optCode,
        newPassword: _newPassword,
        confirmNewPassword: _confirmNewPassword);
    if (check)
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return InfoDialog(
                message: S.of(context).forget_password_done_message,
                onPress: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(
                    NavSlideFromRight(
                      page: Login(),
                    ),
                  );
                });
          });
    // focu
  }

  @override
  Widget build(BuildContext context) {
    _authBlock = Provider.of<AuthProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        CustomToast().showToast(S.of(context).complete_process);
        return false;
      },
      child: AppProcessModal(
        inAsyncCall: _authBlock.authLoader,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).change_password),
          ),
          body: Container(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: appTextField(
                        label: S.of(context).new_password,
                        textField: TextField(
                          obscureText: _passwordShowHide,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (String value) {
                            setState(() {
                              _newPassword = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: S.of(context).new_password,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _passwordShowHide = !_passwordShowHide;
                                });
                              },
                              child: Icon(
                                _passwordShowHide
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: appTextField(
                        label: S.of(context).confirm_new_password,
                        textField: TextField(
                          obscureText: _passwordShowHide,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (String value) {
                            setState(() {
                              _confirmNewPassword = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: S.of(context).confirm_password),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                appButton(S.of(context).change_password, onpress: () {
                  FocusScope.of(context).unfocus();
                  _doChangePassword();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//muller
