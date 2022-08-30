import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  void testShare() {
    Share.share('Share this data', subject: "test share");
  }

  initPlatformStateForStringUniLinks() async {
    getLinksStream().listen((String link) {
      print('got link: $link');
    }, onError: (err) {
      print('got err: $err');
    });
  }

  void _lunchPhone() async {
    await launch("tel:0922299248");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
