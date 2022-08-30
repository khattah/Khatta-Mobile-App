import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/country_code.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/screens/auth/country_codes.dart';
import 'package:jt_trading/src/screens/auth/tem_of_use.dart';
import 'package:jt_trading/src/screens/auth/verification.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/utils/validators.dart' as validator;
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _acceptTerms = true, _passwordShowHide = false;
  CountryCodeModel _codeModel = CountryCodeModel();
  String _fname = "",
      _lname = "",
      _phoneNumber = "",
      _cardID = "",
      _password = "",
      _confirmPassword = "";
  AuthProvider _authBlock;
  void _lunchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        // forceWebView: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void doSignUp() async {
    // print("--------------------muller ------------");
    // print(_codeModel.id);
    // // return;
    // Navigator.of(context).pushReplacement(
    //   NavSlideFromRight(
    //     page: Verification(),
    //   ),
    // );
    // return;
    if (_codeModel.id == null) {
      CustomToast().showToast("something went wrong with country code");
      return;
    }
    if (!(validator.checkAllAreFill(
            [_fname, _lname, _phoneNumber, _password, _confirmPassword]) &&
        validator.nameValidation(_fname) &&
        validator.nameValidation(_lname) &&
        validator.userNameValidation(_phoneNumber) &&
        validator.loginPasswordValidation(_password) &&
        validator.loginPasswordValidation(_confirmPassword))) {
      return;
    }
    if (_password != _confirmPassword) {
      CustomToast().showToast(S.of(context).password_not_match);
      return;
    }
    if (!_acceptTerms) {
      CustomToast().showToast(S.of(context).check_term_of_user);
      return;
    }

    Map<String, String> data = {
      "first_name": _fname,
      "last_name": _lname,
      "phone": _phoneNumber,
      "password": _password,
      "code": _codeModel.id,
      "email": _phoneNumber,
      "cnf-password": _confirmPassword,
      "lang": Provider.of<LanguageProvider>(context, listen: false).code,
      "card_id": _cardID,
    };
    bool check = await _authBlock.signUp(data);
    if (check)
      Navigator.of(context).pushReplacement(
        NavSlideFromRight(
          page: Verification(
              countryCode: _codeModel.id, phoneNumber: _phoneNumber),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LanguageProvider>(context, listen: false);
    _authBlock = Provider.of<AuthProvider>(context);
    final Widget nnn = CountryCodes(codeModel: _codeModel);
    return AppProcessModal(
      inAsyncCall: _authBlock.authLoader,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).sign_up),
        ),
        body: CustomListView(
          child: ListView(
            padding: EdgeInsets.all(appPadding),
            children: [
              Row(
                children: [
                  Expanded(
                    child: appTextField(
                      label: S.of(context).first_name,
                      textField: TextField(
                        onChanged: (String value) {
                          setState(() {
                            _fname = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).first_name_hint,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: appTextField(
                      label: S.of(context).last_name,
                      textField: TextField(
                        onChanged: (String value) {
                          setState(() {
                            _lname = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).last_name_hint,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: appTextField(
                    label: S.of(context).card_id,
                    textField: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      onChanged: (String value) {
                        _cardID = value;
                      },
                      decoration: InputDecoration(
                        hintText: S.of(context).card_id_hint,
                        // prefixIcon: Icon(Icons.lock),
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
                    label: S.of(context).password,
                    textField: TextField(
                      obscureText: !_passwordShowHide,
                      onChanged: (String value) {
                        _password = value;
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
                      label: S.of(context).confirm_password,
                      textField: TextField(
                        obscureText: !_passwordShowHide,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (String value) {
                          setState(() {
                            _confirmPassword = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: S.of(context).confirm_password),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              termOfUse(),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    (bloc.isArabic ? .03 : .1),
              ),
              appButton(S.of(context).sign_up, onpress: () {
                FocusScope.of(context).unfocus();
                doSignUp();
              })
              // _acceptTerms ? appButton(S.of(context).sign_up) : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget termOfUse() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Theme(
          data: ThemeData(accentColor: appPrimaryColor),
          child: Checkbox(
            checkColor: Colors.white,
            // colo
            value: _acceptTerms,
            onChanged: (bool value) {
              setState(() {
                _acceptTerms = !_acceptTerms;
              });
            },
          ),
        ),
        // SizedBox(width: 5),
        Expanded(
          child: RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(text: S.of(context).i_accept),
                new TextSpan(
                    text: S.of(context).term_conditions,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.of(context).push(
                        //   NavSlideFromRight(
                        //     page: TermOfUse(),
                        //   ),
                        // );
                        final bloc = Provider.of<LanguageProvider>(context,
                            listen: false);
                        _lunchUrl(
                          "https://khattah.com/${bloc.isArabic ? 'ar' : 'en'}/privacy",
                        );
                        // print("home lan");
                      },
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, color: appPrimaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
