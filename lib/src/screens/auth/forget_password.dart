import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/country_code.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/screens/auth/country_codes.dart';
import 'package:jt_trading/src/screens/auth/verification.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/utils/validators.dart' as validator;
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  CountryCodeModel _codeModel = CountryCodeModel();
  AuthProvider _authBlock;
  String _phoneNumber = "";
  void _forgetPassword() async {
    if (!validator.checkAllAreFill([_phoneNumber])) return;
    if (!validator.userNameValidation(_phoneNumber)) return;
    bool check = await _authBlock.forgetPassword(
        phoneNumber: _phoneNumber, countryCode: _codeModel.id);
    if (check)
      Navigator.of(context).pushReplacement(
        NavSlideFromRight(
          page: Verification(
            countryCode: _codeModel.id,
            phoneNumber: _phoneNumber,
            isRestPasswordVerification: true,
          ),
        ),
      );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return ForgetPasswordMessage();
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    _authBlock = Provider.of<AuthProvider>(context);
    return AppProcessModal(
      inAsyncCall: _authBlock.authLoader,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).forget_password),
        ),
        body: CustomListView(
          child: ListView(
            padding: EdgeInsets.all(appPadding),
            // shrinkWrap: true,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SvgPicture.asset(
                "assets/forget_password.svg",
                width: 150,
                height: 150,
              ),

              SizedBox(height: 20),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    S.of(context).forget_password_message,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              S.of(context).code,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ]),
                          SizedBox(height: 10),
                          CountryCodes(
                            codeModel: _codeModel,
                            onChange: (_codeModel) {
                              setState(() {
                                this._codeModel = _codeModel;
                              });
                            },
                          ),
                        ],
                      )),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 4,
                    child: appTextField(
                      label: S.of(context).phone_number,
                      textField: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (String value) {
                          setState(() {
                            _phoneNumber = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).phone_number_hint_sign_up,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // appTextField(
              //   label: S.of(context).phone_number,
              //   textField: TextField(
              //     keyboardType: TextInputType.phone,
              //     onChanged: (String value) {
              //       username = value.trim();
              //     },
              //     decoration: InputDecoration(
              //       hintText: S.of(context).phone_number_hint,
              //       prefixIcon: Icon(Icons.phone),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: appButton(S.of(context).submit, onpress: () {
                      FocusScope.of(context).unfocus();
                      _forgetPassword();
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
