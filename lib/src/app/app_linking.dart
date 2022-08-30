import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/src/screens/home/main_tabs.dart';
import 'package:jt_trading/src/screens/home/package_details_invitaion.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:uni_links/uni_links.dart';

class AppLinking extends StatefulWidget {
  @override
  _AppLinkingState createState() => _AppLinkingState();
}

class _AppLinkingState extends State<AppLinking> {
  StreamSubscription subscription;
  String _latestLink = 'Unknown';
  Uri _latestUri;
  StreamSubscription _sub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformStateForStringUniLinks();
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
    print("prams are .....${_latestUri}");
    print(queryParams);
    // print(queryParams[0].value[0]);
    String currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: _latestUri != null
          ? InvitationPackageDetails(invitationId: queryParams[0].value[0])
          : CustomListView(child: MainTabs()),
    );
  }

  initPlatformStateForStringUniLinks() async {
    _sub = getLinksStream().listen((String link) {
      if (!mounted) return;
      setState(() {
        _latestLink = link ?? 'Unknown';
        _latestUri = null;
        try {
          if (link != null) _latestUri = Uri.parse(link);
        } on FormatException {}
      });
    }, onError: (err) {
      if (!mounted) return;
      setState(() {
        _latestLink = 'Failed to get latest link: $err.';
        _latestUri = null;
      });
    });
    // Attach a second listener to the stream
    getLinksStream().listen((String link) {
      print('got link: $link');
    }, onError: (err) {
      print('got err: $err');
    });

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
    if (!mounted) return;
    setState(() {
      _latestLink = initialLink;
      _latestUri = initialUri;
    });
  }
}
