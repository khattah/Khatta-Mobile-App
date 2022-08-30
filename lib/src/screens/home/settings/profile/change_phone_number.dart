import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';

class ChangePhoneNumber extends StatefulWidget {
  @override
  _ChangePhoneNumberState createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).change_number),
      ),
      body: Center(
        child: Text("Change phone number"),
      ),
    );
  }
}
