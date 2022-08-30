import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/package_details_browse.dart';
import 'package:jt_trading/src/screens/home/package_details_history.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  PackageProvider _packageProvider;
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration(), () {
    //   Provider.of<PackageProvider>(context, listen: false).fetchHistoryPackages();
    // });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return Container(
      child: _packageProvider.packageHistoryLoader
          ? Center(child: appCustomProgressIndicator(strokeWidth: 2))
          : _packageProvider.historyPackages.length == 0
              ? Container(
                  child: noPackages(context,
                      S.of(context).no_history_packages),
                  padding: EdgeInsets.all(20))
              : ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: _packageProvider.historyPackages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(NavSlideFromRight(
                            page: HistoryPackageDetails(
                                _packageProvider.historyPackages[index])));
                      },
                      child: packageWidget(
                          _packageProvider.historyPackages[index].package,context),
                    );
                  },
                ),
    );
  }
}
