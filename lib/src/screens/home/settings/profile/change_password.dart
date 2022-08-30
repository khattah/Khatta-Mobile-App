import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/info_dialog.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/validators.dart' as validator;
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _oldPassword = "", _newPassword = "", _confirmNewPassword = "";
  bool _passwordShowHide = true;
  AuthProvider _authBlock;
  _doChangePassword() async {
    if (!(validator.checkAllAreFill(
            [_oldPassword, _newPassword, _confirmNewPassword]) &&
        validator.loginPasswordValidation(_newPassword) &&
        validator.loginPasswordValidation(_confirmNewPassword))) {
      return;
    }
    if (_newPassword != _confirmNewPassword) {
      CustomToast().showToast(S.of(context).password_not_match);
      return;
    }
    bool check = await _authBlock.changePassword(
        oldPassword: _oldPassword,
        newPassword: _newPassword,
        confirmNewPassword: _confirmNewPassword);
    if (check)
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return InfoDialog(
                message: S.of(context).change_password_done_message,
                btnString: S.current.ok,
                onPress: () {
                  Navigator.pop(context);
                });
          });
  }

  @override
  Widget build(BuildContext context) {
    _authBlock = Provider.of<AuthProvider>(context);
    return AppProcessModal(
      inAsyncCall: _authBlock.authLoader,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).change_password),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Row(
                children: [
                  Expanded(
                      child: appTextField(
                    label: S.of(context).old_password,
                    textField: TextField(
                      obscureText: _passwordShowHide,
                      onChanged: (String value) {
                        _oldPassword = value;
                      },
                      decoration: InputDecoration(
                        hintText: S.of(context).password,
                        // prefixIcon: Icon(Icons.lock),
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
                  )),
                ],
              ),
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
    );
  }
}
