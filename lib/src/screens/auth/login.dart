import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/country_code.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/screens/auth/country_codes.dart';
import 'package:jt_trading/src/screens/auth/forget_password.dart';
import 'package:jt_trading/src/screens/auth/sign_up.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/utils/validators.dart' as validator;
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneInputController = TextEditingController();
  bool _passwordShowHide = false;
  String _phoneNumber = "", _password = "";
  CountryCodeModel _codeModel = CountryCodeModel();
  AuthProvider _authBlock;
  void _doLogin() async {
    if (!(validator.checkAllAreFill([_phoneNumber, _password]) &&
        validator.userNameValidation(_phoneNumber))) return;
    // validator.loginPasswordValidation(_password))) return;
    bool check = await _authBlock.login({
      "code": _codeModel.id,
      "identifier": _phoneNumber,
      "lang": Provider.of<LanguageProvider>(context, listen: false).code,
      "password": _password,
    });
    if (check)
      Navigator.of(context).pushReplacement(
        NavSlideFromRight(
          page: MainTabs(),
          // page: MainTabs(isAuth: "Authentic",),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final langBloc = Provider.of<LanguageProvider>(context, listen: false);
    _authBlock = Provider.of<AuthProvider>(context);
    return AppProcessModal(
      // inAsyncCall: false,
      inAsyncCall: _authBlock.authLoader,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).app_title,
            // style: appBarStyle(),
          ),
        ),
        body: Container(
          child: CustomListView(
            child: ListView(
              padding: EdgeInsets.all(appPadding),
              // shrinkWrap: true,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .07),
                appLogo(width: 130, height: 130),
                // Text("muller ${authBlock.authLoader}"),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          S.of(context).sign_in,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  "${S.of(context).phone_number}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10),
                            TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (String value) {
                                _phoneNumber = value;
                              },
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.all(15.0),
                                hintText: S.of(context).phone_number_hint,
                                // prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: !_passwordShowHide,
                  onChanged: (String value) {
                    _password = value;
                  },
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(15.0),
                    hintText: S.of(context).password,
                    prefixIcon: Icon(Icons.lock),
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
                SizedBox(height: 15),
                forgetPassword(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: appButton(S.of(context).sign_in, onpress: () {
                      FocusScope.of(context).unfocus();
                      _doLogin();
                    }))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (langBloc.isArabic ? .025 : .09),
                ),
                _donotHanveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context)
                .push(NavSlideFromRight(page: ForgetPassword()));
          },
          child: new Text(
            S.of(context).forget_passwordQ,
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget _donotHanveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(text: S.of(context).don_have_account),
              new TextSpan(
                  text: S.of(context).sign_up,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context)
                          .push(NavSlideFromRight(page: SignUp()));
                    },
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: appPrimaryColor)),
            ],
          ),
        ),
      ],
    );
  }
}
