import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/home/package_details_invitaion.dart';
import 'package:uni_links/uni_links.dart';

class AppLinkingTest extends StatefulWidget {
  @override
  _AppLinkingTestState createState() => _AppLinkingTestState();
}

class _AppLinkingTestState extends State<AppLinkingTest> {
  StreamSubscription subscription;
  String _latestLink = 'Unknown';
  Uri _latestUri;
  StreamSubscription _sub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initPlatformStateForStringUniLinks();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final queryParams = _latestUri?.queryParametersAll?.entries?.toList();
    print("prams are .....");
    print(queryParams);
    String currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: initPlatformStateForStringUniLinks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("state is ${snapshot.connectionState}");
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return MainTabs();
              // case ConnectionState.waiting: return Center(child: CircularProgressIndicator(strokeWidth: 2));
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return snapshot != null
                      ? InvitationPackageDetails()
                      : MainTabs();
            }
          },


            // if (snapshot.hasData) {
            //   return snapshot != null
            //       ? InvitationPackageDetails()
            //       : MainTabs();
            // }
            // return Container(
            //     child:
            //         Center(child: CircularProgressIndicator(strokeWidth: 2)));
          // },
        ),
      ),
      // body: _latestUri != null ? InvitationPackageDetails() : MainTabs(),
    );
  }

  Future<Uri> initPlatformStateForStringUniLinks() async {
    String initialLink;
    Uri initialUri;
    try {
      initialLink = await getInitialLink();
      print('initial link: $initialLink');
      if (initialLink != null) initialUri = Uri.parse(initialLink);
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
      initialUri = null;
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
      initialUri = null;
    }
    if (!mounted) return null;
    setState(() {
      _latestLink = initialLink;
      _latestUri = initialUri;
    });
    return _latestUri;
  }
}
