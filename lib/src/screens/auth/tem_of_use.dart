import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:flutter/services.dart' show rootBundle;

class TermOfUse extends StatefulWidget {
  @override
  _TermOfUseState createState() => _TermOfUseState();
}

class _TermOfUseState extends State<TermOfUse> {
  String termOfUse = "";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void load() async {
    termOfUse = await rootBundle.loadString(
      'assets/term_of_use/term_of_use_ar.txt',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).term_conditions),
        ),
        body: Container(
          child: ListView(
            children: [
              Text(
                "$termOfUse",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
