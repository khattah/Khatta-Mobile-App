import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/repositories/auth_repo.dart';
import 'package:jt_trading/src/screens/auth/count_down.dart';
import 'package:jt_trading/src/screens/auth/resetpassword.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/processIdenticator.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class Verification extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;
  final bool isRestPasswordVerification;
  Verification(
      {@required this.countryCode,
      this.phoneNumber,
      this.isRestPasswordVerification = false});
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  AuthProvider _authBlock;
  String code = "";
  var focusNode = FocusNode();

  void _verification() async {
    bool check = await _authBlock.verification(code);
    if (check)
      Navigator.of(context).pushReplacement(
        NavSlideFromRight(
          page: MainTabs(),
        ),
      );
    // focusNode.requestFocus();
  }

  void _verificationForgetPassword() async {
    bool check = await _authBlock.verificationForgetPassword(
        phoneNumber: widget.phoneNumber,
        countryCode: widget.countryCode,
        code: code);
    if (check)
      Navigator.of(context).pushReplacement(
        NavSlideFromRight(
          page: RestPassword(
            optCode: code,
          ),
        ),
      );
    // focusNode.requestFocus();
  }

  _sendSMs() async {
    bool check = await AuthProvider().sentSMS(
        countryCode: widget.countryCode, phoneNumber: widget.phoneNumber);
  }

  _sendSMsUnActiveAccount() async {
    await AuthRepo().sentSMsUnActiveAccount();
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
            title: Text(S.of(context).verification),
          ),
          body: CustomListView(
            child: ListView(
              padding: EdgeInsets.all(appPadding),
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      S.of(context).verification_msg,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                PinInputTextField(
                  focusNode: focusNode,
                  // textInputAction: TextInputAction.go,
                  pinLength: 6,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  decoration: UnderlineDecoration(
                    colorBuilder:
                        PinListenColorBuilder(Colors.green, Colors.black54),
                    // bgColorBuilder: _solidEnable ? _solidColor : null,
                  ),
                  onChanged: (String value) {
                    code = value;
                    if (code.length == 6) {
                      FocusScope.of(context).unfocus();
                      widget.isRestPasswordVerification
                          ? _verificationForgetPassword()
                          : _verification();
                    }
                  },
                ),
                SizedBox(height: 40),
                CountDown(
                  doResendSMS: () => widget.isRestPasswordVerification
                      ? _sendSMs()
                      : _sendSMsUnActiveAccount(),
                  // doResendSMS: _sendSMs,
                  // endTimeInSec: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
